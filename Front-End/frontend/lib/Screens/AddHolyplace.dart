import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Widgets/widgets.dart';
import 'package:frontend/ApplicationState/Bloc/Holyplace/blocs.dart';
import 'package:frontend/ApplicationState/Bloc/Login/blocs.dart';
import 'package:frontend/Models/HolyplaceModel.dart';

class HolyPlace extends StatelessWidget {
  HolyPlace({Key? key}) : super(key: key);

  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();
  var controller5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String userid = "";
    LoginState userstate = BlocProvider.of<LoginBloc>(context).state;
    if (userstate is Logedin) {
      userid = userstate.loggedinUserinfo.id.toString();
    }
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Text("Holyplace Form"),
            ),
            Expanded(
                child: CustomTextField(
                    textEditingController: controller1,
                    hinttext: "Enter name of holyplace",
                    icondata: Icon(Icons.place))),
            Expanded(
                child: CustomTextField(
              textEditingController: controller2,
              hinttext: "Enter location ",
              icondata: Icon(Icons.location_city),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller3,
              hinttext: "Enter  History",
              icondata: Icon(Icons.history),
            )),
            Expanded(
                child: CustomTextField(
              textEditingController: controller4,
              hinttext: "Enter Image URL",
              icondata: Icon(Icons.image),
            )),
            Expanded(
                child: CustomRoundButton(
              backroundcolor: Colors.blue,
              displaytext: Text("Add Schedule"),
              onPressedfun: () {
                String nameofHolyplace = controller1.text.toString();
                String location = controller2.text.toString();
                String history = controller3.text.toString();
                String imageurl = controller4.text.toString();
                HolyplaceModel holyplaceModel = HolyplaceModel(
                  userid,
                  nameofHolyplace,
                  history: history,
                  location: location,
                  imageUrl: imageurl,
                );

                BlocProvider.of<HolyPlaceBloc>(context)
                    .add(createHolyplaceEvent(holyplaceModel));
              },
            ))
          ],
        ));
  }
}
