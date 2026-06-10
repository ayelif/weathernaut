import 'package:auto_route/auto_route.dart';
import 'package:weathernaut/app/views/auth/onboarding/onboarding_view.dart';
import 'package:weathernaut/app/views/auth/signin/signin_view.dart';
import 'package:weathernaut/app/views/auth/signup/signup_view.dart';
import 'package:weathernaut/app/views/home/home_view.dart';
import 'package:weathernaut/app/views/news/news_view.dart';
import 'package:weathernaut/app/views/search/search_view.dart';
import 'package:weathernaut/app/views/settings/settings_view.dart';
import 'package:weathernaut/app/views/splash/views/splash_view.dart';
import 'package:weathernaut/app/wrapper/main_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashViewRoute.page, initial: true, path: '/'),
    AutoRoute(page: OnboardingViewRoute.page, path: '/onboarding'),
    AutoRoute(page: SignInViewRoute.page, path: '/signin'),
    AutoRoute(page: SignUpViewRoute.page, path: '/signup'),
    AutoRoute(
      page: MainWrapperRoute.page,
      path: '/main',
      children: [
        AutoRoute(page: HomeViewRoute.page, path: 'home'),
        AutoRoute(page: SearchViewRoute.page, path: 'search'),
        AutoRoute(page: NewsViewRoute.page, path: 'news'),
        AutoRoute(page: SettingsViewRoute.page, path: 'settings'),
      ],
    ),
  ];
}
