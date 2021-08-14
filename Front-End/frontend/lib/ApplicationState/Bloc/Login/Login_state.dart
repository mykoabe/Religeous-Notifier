import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Models/User.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loging extends LoginState {}

class FaildLoging extends LoginState {}

class Logedin extends LoginState {
  String logedinUserinfo;
  Logedin(this.logedinUserinfo);

  @override
  List<Object?> get props => [logedinUserinfo];
}
