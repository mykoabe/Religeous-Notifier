import 'package:flutter/material.dart';
import 'package:frontend/Models/User.dart';
import 'package:frontend/Models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_event.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_state.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginstate = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
        title: Text(
          "Account Setting",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: BlocBuilder(
            bloc: loginstate,
            builder: (BuildContext context, LoginState state) {
              if (state is Logedin) {
                return Column(
                  children: [
                    Container(
                      child: Text(
                          "fullName : ${state.loggedinUserinfo.tojson()['fullName']}"),
                    ),
                    Container(
                      child: Text(
                          "userName : ${state.loggedinUserinfo.tojson()['userName']}"),
                    ),
                    Container(
                      child: Text(
                          "emailAddress : ${state.loggedinUserinfo.tojson()['emailAddress']}"),
                    ),
                    Container(
                      child: Text(
                          "password : ${state.loggedinUserinfo.tojson()['password']}"),
                    ),
                  ],
                );
              }
              return Text("");
            }),
      ),
    );
  }
}
