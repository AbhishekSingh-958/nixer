import 'package:flutter/material.dart';
import 'package:nixler_demo/src/features/dashboard/view/dashboard.dart';

abstract class AppRoutes {
  AppRoutes._();
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? route = settings.name;
    // final arguments = settings.arguments;
    switch (route) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Dashboard(),
          settings: settings,
        );
    }
  }
}
