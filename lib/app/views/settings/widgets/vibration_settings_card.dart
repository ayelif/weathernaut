import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/settings/widgets/settings_card.dart';

class VibrationSettingsCard extends StatefulWidget {
  const VibrationSettingsCard({super.key});

  @override
  State<VibrationSettingsCard> createState() => _VibrationSettingsCardState();
}

class _VibrationSettingsCardState extends State<VibrationSettingsCard> {
  bool _immersiveVibrations = true;

  @override
  void initState() {
    super.initState();
    final settingsBox = Hive.box(HiveBoxes.settings);
    _immersiveVibrations = settingsBox.get('immersiveVibrations', defaultValue: true) as bool;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Icons.vibration_rounded,
      title: context.t.settings.immersiveVibrations,
      subtitle: context.t.settings.immersiveVibrationsDesc,
      child: Switch.adaptive(
        value: _immersiveVibrations,
        onChanged: (val) {
          setState(() {
            _immersiveVibrations = val;
          });
          final settingsBox = Hive.box(HiveBoxes.settings);
          settingsBox.put('immersiveVibrations', val);
        },
      ),
    );
  }
}
