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

  User loggedinUserinfo;

  String access_token;

  Logedin( this.loggedinUserinfo , this.access_token);

  @override
  List<Object?> get props => [  loggedinUserinfo , access_token];
  
}

