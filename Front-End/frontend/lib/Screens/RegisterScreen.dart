import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_State.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_bloc.dart';
import 'package:frontend/Models/User.dart';
import 'package:frontend/Screens/HomePage.dart';
import 'package:frontend/Screens/MainScreen.dart';
import 'package:frontend/Widgets/Button.dart';
import 'package:frontend/Widgets/CustomTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_State.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_event.dart';
import 'package:get/get.dart';

class RegisterController extends StatelessWidget {
  const RegisterController({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => RegisterBloc(),
      child: Register(),
    );
  }
}

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
          CustomTextField(
            hinttext: "Confirm Password",
            textEditingController: controller2,
            icondata: Icon(Icons.password),
          ),
          Hero(
              tag: "Registertag",
              child: CustomRoundButton(
                onPressedfun: () async {
                  User newuser = User(
                    controller1.text.toString(),
                    controller2.text.toString(),
                    userName: "Flutter",
                    fullName: "Flutter Client",
                    userRole: "normal-user",
                    confirmPassword: controller3.text.toString(),
                  );

                  RegisterEvent registerEvent = RegisteringUser(newuser);
                  BlocProvider.of<RegisterBloc>(context).add(registerEvent);
                },
                backroundcolor: Colors.blue,
                displaytext: Text(
                  "Register",
                  style: TextStyle(color: Colors.black),
                ),
              )),
          BlocBuilder<RegisterBloc, RegisterState>(builder: (_, state) {
            
            if (state is Registering) {
              return SpinKitDualRing(
                color: Colors.black,
                size: 50,
              );
            }
            if (state is Registered) {
              return Text(
                  "You have successfully Registered! go back and login");
            }
            if (state is FailedToRegister) {
              return Text("Failed!");
            }
            return Text("");
          }),
        ],
      ),
    );
  }
}
