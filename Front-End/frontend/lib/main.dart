import 'package:flutter/material.dart';

void main() {
  runApp(AppStarter());
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Religious Daily Schedule Notifer app",
      home: Center(
        child: Text(
          "Advanced Mobile Programming, Final Project",
        ),
      ),
    );
  }
}
