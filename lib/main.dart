import 'package:flutter/material.dart';
import 'package:frontend/config/app_router.dart';
import 'UI/pages/homepage.dart';
import 'widget/custom_appbar.dart';
import 'widget/custom_navbar.dart';
import 'UI/pages.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: HomePage.routeName,
    );
  }
} //MyApp



