import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheam(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: const AppBarTheme(
        color: Color.fromARGB(255, 249, 249, 249),
        elevation: 0,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        // textTheam: Theme.of(context).textTheme
      ));

  static ThemeData darkTheam(BuildContext context) => ThemeData(
      //
      brightness: Brightness.dark);
}
