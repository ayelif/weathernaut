import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/views/auth/bloc/auth_bloc.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/settings/widgets/settings_card.dart';

class LogoutSettingsCard extends StatelessWidget {
  const LogoutSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Icons.logout_rounded,
      title: context.t.settings.logout,
      child: IconButton(
        icon: const Icon(Icons.exit_to_app_rounded, color: Colors.redAccent),
        onPressed: () {
          context.read<AuthBloc>().add(SignOutRequested());
        },
      ),
    );
  }
}
