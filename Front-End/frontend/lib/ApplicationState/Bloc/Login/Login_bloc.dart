import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Repository/MainRepository.dart';
import 'package:frontend/Models/User.dart';

import 'Login_event.dart';
import 'Login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LogingUserEvent) {
      yield Loging();

      try {
        Map<String, dynamic> incommingvalue =
            await AuthRepository.LoginUserRepo(event.loginModel);

        User user = User(incommingvalue['currentuser']['emailAddress'],
            incommingvalue['currentuser']['password'],
            fullName: incommingvalue['currentuser']['fullName'],
            userName: incommingvalue['currentuser']['userName'],
            userRole: incommingvalue['currentuser']['userRole']);

        yield Logedin(user, incommingvalue['access_token']);
      } catch (e) {
        yield FaildLoging();
      }
    }

    if (event is LogoutEvent) {
      User logoutuser = User("", "",
          fullName: "", confirmPassword: "", userRole: "", userName: "");
      yield Logedin(logoutuser, "");
    }
  }
}
