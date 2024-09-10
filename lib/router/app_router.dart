
import 'package:ev_flutter/modules/navigation/view/navigation.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  final GoRouter _router = GoRouter(
    initialLocation: NavigationPage.routePath,
    routes: [
      GoRoute(
        path: NavigationPage.routePath,
        builder: (context, state) => const NavigationPage(),
      ),
    ],
  );

  GoRouter get router => _router;
}
