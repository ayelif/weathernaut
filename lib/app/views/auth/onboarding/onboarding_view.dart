import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/resources/resources.g.dart';

@RoutePage()
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToSignIn() {
    Hive.box(HiveBoxes.settings).put('onboarding_seen', true);
    context.router.replaceAll([const SignInViewRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        'title': context.t.onboarding.page1Title,
        'description': context.t.onboarding.page1Desc,
        'icon': '🌤️',
      },
      {
        'title': context.t.onboarding.page2Title,
        'description': context.t.onboarding.page2Desc,
        'icon': '📅',
      },
      {
        'title': context.t.onboarding.page3Title,
        'description': context.t.onboarding.page3Desc,
        'icon': '📍',
      },
    ];

    return BackgroundView(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          page['icon']!,
                          style: const TextStyle(fontSize: 80),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          page['title']!,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['description']!,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? context.colorScheme.primary
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage < pages.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          _goToSignIn();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentPage < pages.length - 1
                            ? context.t.onboarding.next
                            : context.t.onboarding.getStarted,
                      ),
                    ),
                  ),
                  if (_currentPage < pages.length - 1) ...[
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: _goToSignIn,
                      child: Text(context.t.onboarding.skip),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
