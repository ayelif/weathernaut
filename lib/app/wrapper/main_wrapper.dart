import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/gen/strings.g.dart';

@RoutePage()
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeViewRoute(),
        SearchViewRoute(),
        NewsViewRoute(),
        SettingsViewRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
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
        );
      },
    );
  }
}
