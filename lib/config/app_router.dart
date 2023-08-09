import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/UI/pages.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case CartPage.routeName:
        return CartPage.route();
      case AreaPersonalePage.routeName:
        return AreaPersonalePage.route();

      default:
        return _errorRoute();
    } //end switch
  } //onGeneratedRoute

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('ERRORE!'),
        ),
      ),
    );
  }
}//AppRouter
