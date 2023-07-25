import 'package:flutter/material.dart';
import 'package:shopping_app/screens/my_home_page.dart';
import 'package:shopping_app/screens/shop_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
