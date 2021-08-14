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

class LoginController extends StatelessWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Login(),
    );
  }
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
          BlocBuilder<LoginBloc, LoginState>(builder: (_, state) {
            if (state is Loging) {
              return SpinKitDualRing(
                color: Colors.black,
                size: 50,
              );
            }
            if (state is Logedin) {
              return Text("You have successfully Logedin!");
            }
            if (state is FaildLoging) {
              return Text("Failed!");
            }
            return Text("");
          }),
        ],
      ),
    );
  }
}
