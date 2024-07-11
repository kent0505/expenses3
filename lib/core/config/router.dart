import 'package:go_router/go_router.dart';

import '../../features/finance/pages/finance_test_page.dart';
import '../../features/home/models/newsmodel.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/news_page.dart';
import '../../features/money/models/money.dart';
import '../../features/money/pages/add_money_page.dart';
import '../../features/money/pages/edit_money_page.dart';
import '../../features/splash/greetings_page.dart';
import '../../features/splash/name_page.dart';
import '../../features/splash/onboarding_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/target/models/target.dart';
import '../../features/target/pages/target_add_page.dart';
import '../../features/target/pages/target_edit_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/test',
      builder: (context, state) => const FinanceTestPage(),
    ),
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
    GoRoute(
      path: '/news',
      builder: (context, state) => NewsPage(
        newsmodel: state.extra as Newsmodel,
      ),
    ),
    GoRoute(
      path: '/addmoney',
      builder: (context, state) => AddMoneyPage(
        profit: state.extra as bool,
      ),
    ),
    GoRoute(
      path: '/editmoney',
      builder: (context, state) => EditMoneyPage(
        money: state.extra as Money,
      ),
    ),
    GoRoute(
      path: '/addtarget',
      builder: (context, state) => const TargetAddPage(),
    ),
    GoRoute(
      path: '/edittarget',
      builder: (context, state) => TargetEditPage(
        target: state.extra as Target,
      ),
    ),
  ],
);
