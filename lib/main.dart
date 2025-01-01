import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/home_page.dart';
import 'package:flutter_application_2/widgets.dart/theam.dart';

import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheam(context),
      darkTheme: MyTheme.darkTheam(context),
      debugShowCheckedModeBanner: true,
      initialRoute: MyRoute.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoute.loginRoutes: (context) => const LoginPage(),
        MyRoute.homeRoute: (context) => const homepage()
      },
    );
  }
}
