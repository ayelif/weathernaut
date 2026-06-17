import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/app/views/search/bloc/search_bloc.dart';
import 'package:weathernaut/app/views/search/widgets/city_preview_sheet.dart';
import 'package:weathernaut/app/views/search/widgets/saved_cities_list.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/widgets/inputs/custom_text_form_field.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weathernaut/core/data/network/firestore_service.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late Box _citiesBox;

  @override
  void initState() {
    super.initState();
    _citiesBox = Hive.box(HiveBoxes.cities);
    _syncFirestoreCities();
  }

  Future<void> _syncFirestoreCities() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final firestoreCities = await FirestoreService().getSavedCities(uid);
      if (firestoreCities.isNotEmpty) {
        final currentLocal = _savedCities;
        bool changed = false;
        for (final city in firestoreCities) {
          if (!currentLocal.contains(city)) {
            await _citiesBox.add(city);
            changed = true;
          }
        }
        final combined = _savedCities;
        if (combined.length > firestoreCities.length || changed) {
          await FirestoreService().saveCities(uid, combined);
        }
        if (mounted) {
          setState(() {});
        }
      }
    }
  }

  List<String> get _savedCities => _citiesBox.values.cast<String>().toList();

  void _addCity(String name) async {
    if (!_savedCities.contains(name)) {
      await _citiesBox.add(name);
      setState(() {});
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await FirestoreService().saveCities(uid, _savedCities);
      }
    }
  }

  void _removeCity(String name) async {
    final key = _citiesBox.keys.firstWhere(
      (k) => _citiesBox.get(k) == name,
      orElse: () => null,
    );
    if (key != null) {
      await _citiesBox.delete(key);
      setState(() {});
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        await FirestoreService().saveCities(uid, _savedCities);
      }
    }
  }

  void _showCityPreview(BuildContext context, Map<String, dynamic> cityData) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, scrollController) => BlocProvider.value(
          value: context.read<HomeBloc>(),
          child: CityPreviewSheet(
            cityData: cityData,
            onSaved: () => _addCity(cityData['name'] as String),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: DashboardView(
        appBar: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.search.title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: context.t.search.placeholder,
                prefixIcon: Icons.search_rounded,
                onChanged: (val) =>
                    context.read<SearchBloc>().add(SearchCity(val)),
              ),
            ],
          ),
        ),
        children: [
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return SavedCitiesList(
                  cities: _savedCities,
                  onCityRemoved: (city) => _removeCity(city),
                );
              }
              if (state is SearchLoading)
                return const Center(child: CircularProgressIndicator());
              if (state is SearchError)
                return Center(child: Text(state.message));
              if (state is SearchLoaded)
                return _buildResults(context, state.results);
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResults(BuildContext context, List<dynamic> results) {
    if (results.isEmpty) return Center(child: Text(context.t.search.noResults));
    return Column(
      children: results.map((result) {
        final name = result['name'] ?? '';
        final country = result['country'] ?? '';
        final region = result['region'] ?? '';
        return InkWell(
          onTap: () => _showCityPreview(context, result),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.surface.withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.colorScheme.primary.withOpacity(0.05),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded, color: Colors.blueAccent),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$region, $country',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
