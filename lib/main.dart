import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'route_generator.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/': (_) => HomeWeb(),
      //   '/about': (_) => AboutWeb(),
      // },
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      //     (settings) {
      //   final args = settings.arguments;
      //   switch (settings.name) {
      //     case '/':
      //       return MaterialPageRoute(builder: (_) => HomeWeb());
      //     case '/about':
      //       return MaterialPageRoute(
      //         builder: (context) => AboutWeb(args),
      //       );
      //     default:
      //       return _errorRoute();
      //   }
      // },
    );
  }
}
