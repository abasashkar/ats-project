import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:resume_pro/features/auth/ui/login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<HomePageState> homePageKey = GlobalKey<HomePageState>();

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    //  GoRoute(
    //     name: Routes.home,
    //     path: '/home',
    //     builder: (BuildContext context, GoRouterState state) {
    //       return HomePage(key: homePageKey);
    //     },
    //   ),
  ],
);
