import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:weathernaut/app/views/news/bloc/news_bloc.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/utils/locale/locale_bloc.dart';
import 'package:weathernaut/gen/strings.g.dart';

@RoutePage()
class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    final homeState = context.read<HomeBloc>().state;
    final city = homeState is HomeLoaded ? homeState.city : 'Istanbul';
    final locale = context.read<LocaleBloc>().state.locale;
    final lang = locale == AppLocale.en ? 'en' : 'tr';
    context.read<NewsBloc>().add(LoadNews(city, lang: lang));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LocaleBloc, LocaleState>(
          listener: (context, localeState) {
            final homeState = context.read<HomeBloc>().state;
            final city = homeState is HomeLoaded ? homeState.city : 'Istanbul';
            final lang = localeState.locale == AppLocale.en ? 'en' : 'tr';
            context.read<NewsBloc>().add(LoadNews(city, lang: lang));
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (previous, current) {
            if (current is HomeLoaded) {
              if (previous is! HomeLoaded || previous.city != current.city) {
                return true;
              }
            }
            return false;
          },
          listener: (context, homeState) {
            if (homeState is HomeLoaded) {
              final locale = context.read<LocaleBloc>().state.locale;
              final lang = locale == AppLocale.en ? 'en' : 'tr';
              context.read<NewsBloc>().add(LoadNews(homeState.city, lang: lang));
            }
          },
        ),
      ],
      child: BackgroundView(
        child: DashboardView(
          appBar: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Text(
              context.t.news.title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ),
          children: [
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is NewsError) {
                  return Center(child: Text(state.message));
                }
                if (state is NewsLoaded) {
                  return _buildNewsList(context, state.articles);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList(BuildContext context, List<dynamic> articles) {
    if (articles.isEmpty) {
      return Center(child: Text(context.t.news.noNews));
    }
    return Column(
      children: articles.map((article) {
        final title = article['title'] ?? '';
        final description = article['description'] ?? '';
        final source = article['source']?['name'] ?? '';
        final imageUrl = article['urlToImage'];
        final url = article['url'] ?? '';

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: context.colorScheme.surface.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: context.colorScheme.primary.withOpacity(0.05),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      source,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.colorScheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (description.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      Text(
                        description,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
