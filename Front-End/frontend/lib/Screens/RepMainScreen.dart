import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Widgets/widgets.dart';
import 'package:frontend/ApplicationState/Bloc/Login/blocs.dart';
import 'package:frontend/Models/models.dart';
import 'package:frontend/ApplicationState/Bloc/Schedule/blocs.dart';
import 'package:get/get_navigation/get_navigation.dart';

class RepMainScreen extends StatelessWidget {
  RepMainScreen({Key? key}) : super(key: key);
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();

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
          title: Text("Search",
              style: TextStyle(
                color: Colors.black,
              )),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                  onSelected: (value) {
                    switch (value) {
                      case 1:
                        loginstate.add(LogoutEvent());
                        Navigator.pushNamed(context, '/');
                        break;
                      case 2:
                        Navigator.pushNamed(context, "/accountsettings");
                        break;
                      case 3:
                        Navigator.pushNamed(context, "/addholyplace");
                        break;
                      case 4:
                        Navigator.pushNamed(context, "/addschudule");
                        break;
                    }
                  },
                  offset: Offset(5, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color(0xff757575),
                  elevation: 10,
                  icon: Icon(
                    Icons.circle,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          value: 1,
                          child: Text(
                            "logout",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          "my Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      PopupMenuItem(
                          value: 3,
                          child: Text(
                            "Add holypalce",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                      PopupMenuItem(
                          value: 4,
                          child: Text(
                            "add schedule",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                    ];
                  }),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Text("Schedule Form"),
            ),
            Expanded(
                child: CustomTextField(
              textEditingController: controller1,
              hinttext: "Enter Your Name",
              icondata: Icon(Icons.person),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller2,
              hinttext: "Enter first Schedule",
              icondata: Icon(Icons.schedule),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller3,
              hinttext: "Enter second Schedule",
              icondata: Icon(Icons.schedule),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller4,
              hinttext: "Enter third Schedule",
              icondata: Icon(Icons.schedule),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller5,
              hinttext: "Enter fourth Schedule",
              icondata: Icon(Icons.schedule),
            )),
            Expanded(
                child: CustomRoundButton(
              backroundcolor: Colors.blue,
              displaytext: Text("Add Schedule"),
              onPressedfun: () {
                Schedule schedule = Schedule("", []);
                schedule.createdby = controller1.text.toString();
                schedule.allprograms = [
                  controller2.text.toString(),
                  controller3.text.toString(),
                  controller4.text.toString(),
                  controller5.text.toString(),
                ];

                BlocProvider.of<ScheduleBloc>(context)
                    .add(AddingScheduleEvent(schedule));
              },
            )),
          ],
        ));
  }
}
