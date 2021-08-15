import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Screens/AdminPage.dart';
import 'package:frontend/Screens/HomePage.dart';
import 'package:frontend/Screens/MainScreen.dart';
import 'package:frontend/Screens/RepMainScreen.dart';

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
      // home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/mainscreen': (context) => MainScreen(),
        '/repmainscreen': (context) => RepMainScreen(),
        '/adminpage': (context) => AdminPage(),

      },
    );
  }
}
