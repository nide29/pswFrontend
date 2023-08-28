import 'package:flutter/material.dart';

import '../UI/pages/cart.dart';
import '../UI/pages/loginPage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.yellowAccent.withOpacity(0.63),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontFamily: 'Avenir',
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/areaPersonale');
                //Navigator.push(context, MaterialPageRoute(builder: ((context) => Login())));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => Cart())));
              },
              icon: const Icon(Icons.shopping_cart))
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
