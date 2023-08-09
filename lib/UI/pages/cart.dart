import 'package:flutter/material.dart';

import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class CartPage extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'CARRELLO',
        style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87),
    );
  }
}
