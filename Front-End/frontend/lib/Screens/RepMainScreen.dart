import 'package:flutter/material.dart';
// import 'package:frontend/Models/User.dart';
// import 'package:frontend/Models/User.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
// import 'package:frontend/ApplicationState/Bloc/Login/Login_event.dart';
// import 'package:frontend/ApplicationState/Bloc/Login/Login_state.dart';



class RepMainScreen extends StatelessWidget {
  RepMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white12,
          iconTheme: IconThemeData(color: Colors.black87),
          // automaticallyImplyLeading: false,
          actions: [Icon(Icons.logout)],
        ),
        body: Column(
          children: [
            Container(
              child: Center(child: Text("Dear Rep.., Succefully Logged In. "),),
            ),
          ],
        ));
  }
}
