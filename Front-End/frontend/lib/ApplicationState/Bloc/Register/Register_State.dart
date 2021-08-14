import 'package:equatable/equatable.dart';
import 'package:frontend/Models/User.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Registering extends RegisterState {}

class FailedToRegister extends RegisterState {}

class Registered extends RegisterState {

  User registeredUser;
  Registered(this.registeredUser);
  @override
  List<Object?> get props => [registeredUser];
  
}
