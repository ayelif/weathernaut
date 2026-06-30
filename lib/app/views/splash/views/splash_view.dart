import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/data/local/hive_boxes.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/resources/resources.g.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _logoOpacityAnimation;
  late final Animation<double> _textOpacityAnimation;
  late final Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _initializeApp();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeApp() {
    // Keep splash screen for 3 seconds to let the Lottie animation play beautifully
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (!mounted) return;

      final settingsBox = Hive.box(HiveBoxes.settings);
      final onboardingSeen = settingsBox.get('onboarding_seen', defaultValue: false) as bool;

      bool isUserLoggedIn = false;
      try {
        if (Firebase.apps.isNotEmpty) {
          isUserLoggedIn = FirebaseAuth.instance.currentUser != null;
        }
      } catch (_) {
        // Firebase not initialized yet
      }

      if (!onboardingSeen) {
        context.router.replaceAll([const OnboardingViewRoute()]);
      } else if (!isUserLoggedIn) {
        context.router.replaceAll([const SignInViewRoute()]);
      } else {
        context.router.replaceAll([const MainWrapperRoute()]);
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
            FadeTransition(
              opacity: _logoOpacityAnimation,
              child: ScaleTransition(
                scale: _logoScaleAnimation,
                child: Lottie.asset(
                  'assets/animations/sunny.json',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _textOpacityAnimation,
              child: SlideTransition(
                position: _textSlideAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.t.appName,
                      style: context.textTheme.displayLarge?.copyWith(
                        color: context.theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
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
            ),
          ],
        ),
      ),
    );
  }
}
