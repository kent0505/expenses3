import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/splash/greetings_page.dart';
import '../../features/splash/name_page.dart';
import '../../features/splash/onboarding_page.dart';
import '../../features/splash/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/name',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/name',
      builder: (context, state) => const NamePage(),
    ),
    GoRoute(
      path: '/greetings',
      builder: (context, state) => const GreetingsPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
