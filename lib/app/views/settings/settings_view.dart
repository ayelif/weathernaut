import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/app/views/auth/bloc/auth_bloc.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/base/dashboard_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/app/views/settings/widgets/profile_card.dart';
import 'package:weathernaut/app/views/settings/widgets/units_settings_card.dart';
import 'package:weathernaut/app/views/settings/widgets/theme_settings_card.dart';
import 'package:weathernaut/app/views/settings/widgets/language_settings_card.dart';
import 'package:weathernaut/app/views/settings/widgets/vibration_settings_card.dart';
import 'package:weathernaut/app/views/settings/widgets/logout_settings_card.dart';
import 'package:weathernaut/app/views/settings/widgets/edit_name_dialog.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final _auth = FirebaseAuth.instance;
  bool _isUploading = false;
  String? _photoUrl;

  @override
  void initState() {
    super.initState();
    final user = _auth.currentUser;
    if (user != null) {
      _photoUrl = user.photoURL ?? Hive.box(HiveBoxes.settings).get('profile_picture_${user.uid}');
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
      
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('users/${user.uid}/profile_picture.jpg');
          
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      final uploadTask = await storageRef.putData(bytes, metadata);
      final downloadUrl = await uploadTask.ref.getDownloadURL();

      await user.updatePhotoURL(downloadUrl);
      await user.reload();

      if (mounted) {
        setState(() {
          _photoUrl = _auth.currentUser?.photoURL;
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

    final newName = await showDialog<String>(
      context: context,
      builder: (context) => EditNameDialog(initialName: user.displayName ?? ''),
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

  @override
  Widget build(BuildContext context) {
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
            ProfileCard(
              displayName: _auth.currentUser?.displayName ?? '',
              email: _auth.currentUser?.email ?? '',
              photoUrl: _photoUrl,
              isUploading: _isUploading,
              onUploadImageTap: _uploadProfileImage,
              onEditNameTap: _editProfileName,
            ),
            const SizedBox(height: 24),
            const UnitsSettingsCard(),
            const SizedBox(height: 16),
            const ThemeSettingsCard(),
            const SizedBox(height: 16),
            const LanguageSettingsCard(),
            const SizedBox(height: 16),
            const VibrationSettingsCard(),
            const SizedBox(height: 16),
            const LogoutSettingsCard(),
          ],
        ),
      ),
    );
  }
}
