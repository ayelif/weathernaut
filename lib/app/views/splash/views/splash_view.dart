import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/resources/resources.g.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.router.replaceAll([const OnboardingViewRoute()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wb_sunny_rounded, size: 100, color: Colors.amber),
            const SizedBox(height: 24),
            Text(
              context.t.appName,
              style: context.textTheme.displayLarge?.copyWith(
                color: context.theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black87,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              context.t.welcome,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.theme.brightness == Brightness.dark
                    ? Colors.white70
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
