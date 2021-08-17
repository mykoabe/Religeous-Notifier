import 'package:equatable/equatable.dart';
// import 'package:frontend/Models/User.dart';
import 'package:frontend/Models/LoginModel.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogingUserEvent extends LoginEvent {
  final LoginModel loginModel;
  LogingUserEvent(this.loginModel);

  @override
  List<Object?> get props => [loginModel];
}

class LogoutEvent extends LoginEvent {}

