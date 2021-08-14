import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Screens/HomePage.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(AppStarter());
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Religious Daily Schedule Notifer app",
      home: HomePage(),
    );
  }
}
