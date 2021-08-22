import 'package:flutter/material.dart';
// import 'package:frontend/Models/User.dart';
// import 'package:frontend/Models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_event.dart';
import 'package:frontend/ApplicationState/Bloc/Login/Login_state.dart';
import 'package:frontend/ApplicationState/Bloc/Schedule/Schedule_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Schedule/Schedule_state.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var loginstate = BlocProvider.of<LoginBloc>(context);
    var schedulestate = BlocProvider.of<ScheduleBloc>(context);

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
          title: Text("Search",
              style: TextStyle(
                color: Colors.black,
              )),
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
        body: Container(
          child: BlocBuilder(
            bloc: schedulestate,
            builder: (BuildContext context, ScheduleState state) {
              if (state is LoadingSchedules) {
                return SpinKitDualRing(
                  color: Colors.black,
                  size: 50,
                );
              }

              if (state is OnScheduleLoadSuccess) {
                // return Text("${state.allschedules.toString()}");
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: state.allschedules.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Card(
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "programs: ${state.allschedules[index]['programs']}"),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                  "createdby:  ${state.allschedules[index]['createdby']}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Text("noting found!");
            },
          ),
        ));
  }
}
