import 'package:flutter/material.dart';
import 'package:weathernaut/gen/strings.g.dart';
import 'package:weathernaut/app/views/settings/widgets/settings_card.dart';

class UnitsSettingsCard extends StatefulWidget {
  const UnitsSettingsCard({super.key});

  @override
  State<UnitsSettingsCard> createState() => _UnitsSettingsCardState();
}

class _UnitsSettingsCardState extends State<UnitsSettingsCard> {
  bool _isCelsius = true;

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
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
    );
  }
}
