import 'package:flutter/material.dart';

import 'about_mobile.dart';
import 'about_web.dart';
import 'home_mobile.dart';
import 'home_web.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => // HomeWeb(),
              LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return HomeWeb();
              } else {
                return HomeMobile();
              }
            },
          ),
        );
      case '/about':
        final args = settings.arguments;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return AboutWeb(
                  str: args,
                );
              } else {
                return AboutMobile(
                  str: args,
                );
              }
            },
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Center(
          child: Text("Error Page"),
        );
      },
    );
  }
}
