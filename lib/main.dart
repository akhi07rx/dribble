import 'package:flutter/material.dart';
import 'package:project_dribble/dribble_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WebViewEx(),
    );
  }
}
