import 'package:flutter/material.dart';
import 'package:frontend/Models/User.dart';
import 'package:frontend/Models/User.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key, this.user}) : super(key: key);
  var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("${user!['emailAddress']} Registered"),
        ),
      ),
    );
  }
}
