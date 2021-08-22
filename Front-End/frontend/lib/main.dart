import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:frontend/Screens/AccountSetting.dart';
// import 'package:frontend/Screens/AdminPage.dart';
// import 'package:frontend/Screens/HomePage.dart';
// import 'package:frontend/Screens/MainScreen.dart';
// import 'package:frontend/Screens/RepMainScreen.dart';

import 'package:frontend/ApplicationState/Bloc/Login/Login_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Register/Register_bloc.dart';
import 'package:frontend/ApplicationState/Bloc/Schedule/Schedule_bloc.dart';

import 'package:frontend/generators/route_generator.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(AppStarter());
}

class AppStarter extends StatelessWidget {
  const AppStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScheduleBloc>(
          create: (BuildContext context) => ScheduleBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (BuildContext context) => RegisterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Religious Daily Schedule Notifer app",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
