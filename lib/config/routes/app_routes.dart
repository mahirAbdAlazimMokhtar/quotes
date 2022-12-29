import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/random_quote/presentation/screens/quote_screen.dart';

class Routes {
  static const String initialRoutes = '/';
}

// final routes = {Routes.initialRoutes: (context) => const QuoteScreen()};
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(
          builder: (context) => const QuoteScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
