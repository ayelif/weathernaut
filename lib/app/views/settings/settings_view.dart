import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/app/views/auth/bloc/auth_bloc.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/themes/bloc/theme_bloc.dart';
import 'package:weathernaut/core/utils/locale/locale_bloc.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/home/bloc/home_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _isCelsius = true;
  final _auth = FirebaseAuth.instance;
  bool _isUploading = false;
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    if (user != null) {
      final settingsBox = Hive.box(HiveBoxes.settings);
      _photoUrl = settingsBox.get('profile_picture_${user.uid}');
    }
  }

  Future<void> _uploadProfileImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 256,
      maxHeight: 256,
      imageQuality: 70,
    );

    if (image == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception('User not logged in');

      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      final settingsBox = Hive.box(HiveBoxes.settings);
      await settingsBox.put('profile_picture_${user.uid}', base64Image);

      if (mounted) {
        setState(() {
          _photoUrl = base64Image;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil fotoğrafı güncellendi!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata oluştu: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  Future<void> _editProfileName() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final controller = TextEditingController(text: user.displayName);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(context.t.settings.updateNameTitle),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: context.t.settings.updateNameHint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.t.settings.cancel),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.t.settings.nameError)),
                  );
                  return;
                }
                Navigator.pop(context, text);
              },
              child: Text(context.t.settings.save),
            ),
          ],
        );
      },
    );

    if (newName != null && newName.isNotEmpty && newName != user.displayName) {
      setState(() {
        _isUploading = true;
      });
      try {
        await user.updateDisplayName(newName);
        await user.reload();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.t.settings.nameUpdated)),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hata: ${e.toString()}')),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isUploading = false;
          });
        }
      }
    }
  }

  Widget _buildProfileCard(BuildContext context) {
    final user = _auth.currentUser;
    final displayName = user?.displayName ?? '';
    final email = user?.email ?? '';
    final photoUrl = _photoUrl;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.05),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: context.colorScheme.primary.withOpacity(0.1),
                backgroundImage: photoUrl != null ? MemoryImage(base64Decode(photoUrl)) : null,
                child: photoUrl == null
                    ? Text(
                        displayName.isNotEmpty
                            ? displayName.substring(0, 1).toUpperCase()
                            : (email.isNotEmpty ? email.substring(0, 1).toUpperCase() : '?'),
                        style: context.textTheme.headlineMedium?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              if (_isUploading)
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 3,
                      ),
                    ),
                  ),
                )
              else
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _uploadProfileImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        displayName.isNotEmpty ? displayName : 'Kullanıcı',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit_rounded,
                        size: 18,
                        color: context.colorScheme.primary,
                      ),
                      onPressed: _editProfileName,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleBloc>().state.locale;
    final currentThemeMode = context.watch<ThemeBloc>().state.themeMode;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          context.router.replaceAll([const SignInViewRoute()]);
        }
      },
      child: BackgroundView(
        child: DashboardView(
          appBar: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 12),
            child: Row(
              children: [
                Text(
                  context.t.settings.title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          children: [
            _buildProfileCard(context),
            const SizedBox(height: 24),
            // Units Settings Card
            _buildSettingsCard(
              context,
              icon: Icons.thermostat_rounded,
              title: context.t.settings.units,
              child: Row(
                children: [
                  ChoiceChip(
                    label: const Text('°C'),
                    selected: _isCelsius,
                    onSelected: (val) {
                      setState(() {
                        _isCelsius = true;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text('°F'),
                    selected: !_isCelsius,
                    onSelected: (val) {
                      setState(() {
                        _isCelsius = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Theme Settings Card (Dropdown to choose Light, Dark, or System)
            _buildSettingsCard(
              context,
              icon: Icons.dark_mode_rounded,
              title: context.t.settings.theme,
              child: DropdownButton<ThemeMode>(
                value: currentThemeMode,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(context.t.settings.systemTheme),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(context.t.settings.lightMode),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(context.t.settings.darkMode),
                  ),
                ],
                onChanged: (mode) {
                  if (mode != null) {
                    context.read<ThemeBloc>().add(ChangeTheme(mode));
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Language Settings Card
            _buildSettingsCard(
              context,
              icon: Icons.language_rounded,
              title: context.t.settings.language,
              child: DropdownButton<AppLocale>(
                value: currentLocale,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                items: [
                  DropdownMenuItem(
                    value: AppLocale.en,
                    child: Text(context.t.settings.english),
                  ),
                  DropdownMenuItem(
                    value: AppLocale.tr,
                    child: Text(context.t.settings.turkish),
                  ),
                ],
                onChanged: (locale) {
                  if (locale != null) {
                    context.read<LocaleBloc>().add(ChangeLocale(locale));
                    final lang = locale == AppLocale.tr ? 'tr' : 'en';
                    final homeState = context.read<HomeBloc>().state;
                    final city = homeState is HomeLoaded
                        ? homeState.city
                        : 'Istanbul';
                    context.read<HomeBloc>().add(LoadWeather(city, lang: lang));
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Logout Settings Card
            _buildSettingsCard(
              context,
              icon: Icons.logout_rounded,
              title: context.t.settings.logout,
              child: IconButton(
                icon: const Icon(Icons.exit_to_app_rounded, color: Colors.redAccent),
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutRequested());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: context.colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
