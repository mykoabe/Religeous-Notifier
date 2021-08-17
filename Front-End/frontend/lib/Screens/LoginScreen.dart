import 'package:flutter/material.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:frontend/Screens/MainScreen.dart';
import 'package:frontend/Widgets/Button.dart';
import 'package:frontend/Widgets/CustomTextField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/Models/LoginModel.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_event.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_state.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/get_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

// class LoginController extends StatelessWidget {
//   const LoginController({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LoginBloc(),
//       child: Login(),
//     );
//   }
// }

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginbloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hinttext: "Email Address",
            textEditingController: controller1,
            icondata: Icon(Icons.email),
          ),
          CustomTextField(
            hinttext: "Password",
            textEditingController: controller2,
            icondata: Icon(Icons.password),
          ),
          Hero(
            tag: "logintag",
            child: CustomRoundButton(
              onPressedfun: () {
                LoginModel loginModel = LoginModel(
                    controller1.text.toLowerCase().toString(),
                    controller2.text.toString());
                LoginEvent loginEvent = LogingUserEvent(loginModel);
                BlocProvider.of<LoginBloc>(context).add(loginEvent);
              },
              backroundcolor: Colors.red,
              displaytext: Text(
                "Login",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          BlocListener(
            bloc: loginbloc,
            listener: (BuildContext context, LoginState state) {
              if (state is Logedin) {
                var currentuser = state.loggedinUserinfo.tojson();
                String role = currentuser['userRole'];

                if (role == "Representative") {
                  Navigator.pushNamed(context, '/repmainscreen');
                } else if (role == "user") {
                  Navigator.pushNamed(context, '/mainscreen');
                } else if (role == "Admin") {
                  Navigator.pushNamed(context, '/adminpage');
                }
              }
            },
            child: BlocBuilder(
              bloc: loginbloc,
              builder: (BuildContext context, LoginState state) {
                if (state is Loging) {
                  return SpinKitDualRing(
                    color: Colors.black,
                    size: 50,
                  );
                }
                if (state is Logedin) {
                  print(state.access_token);
                  print(state.loggedinUserinfo.tojson());
                  return Text("loggedin");
                }
                if (state is FaildLoging) {
                  return Text("Failed!");
                }
                return Text("");
              },
            ),
          ),
        ],
      ),
    );
  }
}
