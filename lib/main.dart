import 'package:flutter/material.dart';
import 'package:taxi_user/screens/pages/operator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OperatorPage(),
    );
  }
}
