import 'package:flutter/material.dart';
import 'package:frontend/Screens/AccountSetting.dart';
import 'package:frontend/Screens/AdminPage.dart';
import 'package:frontend/Screens/HomePage.dart';
import 'package:frontend/Screens/MainScreen.dart';
import 'package:frontend/Screens/RepMainScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/mainscreen':
        return MaterialPageRoute(builder: (context) => MainScreen());
        // Validation of correct data type
        // if (args is Routes) {
        //   return MaterialPageRoute(
        //     builder: (_) => SecondScreen(data: args),
        //   );
        // }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        // return _errorRoute();
      case '/repmainscreen':
        return MaterialPageRoute(builder: (context) => RepMainScreen());
      case '/adminpage':
        return MaterialPageRoute(builder: (context) => AdminPage());
      case '/accountsettings':
        return MaterialPageRoute(builder: (context) => AccountSetting());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
