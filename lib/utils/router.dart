import 'package:flutter/material.dart';
import 'package:hardik_atliq/screens/home_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Route Define for ${settings.name}',
              ),
            ),
          ),
        );
        break;
    }
  }
}
