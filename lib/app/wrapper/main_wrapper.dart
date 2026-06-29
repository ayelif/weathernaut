import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/gen/strings.g.dart';

@RoutePage()
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AutoTabsScaffold(
      routes: const [
        HomeViewRoute(),
        SearchViewRoute(),
        NewsViewRoute(),
        SettingsViewRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SafeArea(
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              height: 72,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withOpacity(0.75),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: theme.colorScheme.onSurface.withOpacity(0.08),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(theme.brightness == Brightness.dark ? 0.25 : 0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: NavigationBar(
                    height: 72,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: (index) {
                      if (index != tabsRouter.activeIndex) {
                        HapticFeedback.selectionClick();
                        tabsRouter.setActiveIndex(index);
                      }
                    },
                    destinations: [
                      NavigationDestination(
                        icon: const Icon(Icons.home_outlined),
                        selectedIcon: const Icon(Icons.home_rounded),
                        label: context.t.home.title,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.search_outlined),
                        selectedIcon: const Icon(Icons.search_rounded),
                        label: context.t.search.title,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.newspaper_outlined),
                        selectedIcon: const Icon(Icons.newspaper_rounded),
                        label: context.t.news.title,
                      ),
                      NavigationDestination(
                        icon: const Icon(Icons.settings_outlined),
                        selectedIcon: const Icon(Icons.settings_rounded),
                        label: context.t.settings.title,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
