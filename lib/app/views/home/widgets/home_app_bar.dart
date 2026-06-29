import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/gen/strings.g.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String city;

  const HomeAppBar({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                DateFormat(
                  'EEEE, d MMM',
                  TranslationProvider.of(context).locale == AppLocale.tr
                      ? 'tr'
                      : 'en',
                ).format(DateTime.now()),
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: context.colorScheme.surface.withOpacity(0.8),
            ),
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
