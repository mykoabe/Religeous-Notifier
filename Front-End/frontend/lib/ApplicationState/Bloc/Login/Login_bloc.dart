import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Repository/MainRepository.dart';

import 'Login_event.dart';
import 'Login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LogingUserEvent) {
      yield Loging();

      try {
        String incommingvalue =
            await AuthRepository.LoginUserRepo(event.loginModel);
        if (incommingvalue == "Invalid Credentials") {
          yield FaildLoging();
        } else {
          yield Logedin(incommingvalue);
        }
      } catch (e) {
        yield FaildLoging();
      }
    }
  }
}
