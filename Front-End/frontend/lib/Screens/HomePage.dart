import 'package:flutter/material.dart';
import 'package:frontend/Screens/LoginScreen.dart';
import 'package:frontend/Screens/RegisterScreen.dart';
import 'package:frontend/Widgets/Button.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "logintag",
            child: CustomRoundButton(
              onPressedfun: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              backroundcolor: Colors.red,
              displaytext: Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Hero(
            tag: "Registertag",
            child: CustomRoundButton(
              onPressedfun: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterController()));
              },
              backroundcolor: Colors.blue,
              displaytext: Text(
                "Register",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
