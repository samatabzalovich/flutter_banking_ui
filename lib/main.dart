import 'package:flutter/material.dart';
import 'package:flutter_banking_ui/view/pages/home_page.dart';
import 'package:flutter_banking_ui/view/pages/pin_page.dart';
import 'package:flutter_banking_ui/view/pages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  const PinPage(),
    );
  }
}
