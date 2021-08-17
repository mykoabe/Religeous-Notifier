import 'package:flutter/material.dart';
// import 'package:frontend/Models/User.dart';
// import 'package:frontend/Models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_event.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var loginstate = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
        drawer: Drawer(
            child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 130, left: 20),
                    child: Text(
                      "AMP final project",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Account Setting"),
              onTap: () {
                Navigator.pushNamed(context, '/accountsettings');
              },
            ),
          ],
        )),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white12,
          iconTheme: IconThemeData(color: Colors.black87),
          actions: [
            GestureDetector(
              child: Icon(Icons.logout),
              onTap: () {
                loginstate.add(LogoutEvent());
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
        body: Column(
          children: [
            BlocBuilder(
                bloc: loginstate,
                builder: (BuildContext context, LoginState state) {
                  if (state is Logedin) {
                    return Container(
                      child: Center(
                        child: Text(
                          "Dear ${state.loggedinUserinfo.tojson()['userName'].toString()} , you have Succefully Logged In.",
                        ),
                      ),
                    );
                  }
                  return Text("");
                }),
            Container(
              child: ElevatedButton(
                child: Text("get protected value"),
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
