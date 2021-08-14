import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:frontend/Models/User.dart';
import 'package:frontend/Models/LoginModel.dart';

class ClientAuthDataProvider {
  // Register User

  static Future<User> register(User user) async {
    User currentuser = User("", "");
    try {
      final httpresponse = await http.post(
          Uri.parse('http://localhost:3500/api/RegisterUser'),
          body: user.tojson());
      if (httpresponse.statusCode == 201) {
        var incommingvalue = jsonDecode(httpresponse.body);
        currentuser = User(
            incommingvalue['emailAddress'], incommingvalue['password'],
            userName: incommingvalue['userName'],
            fullName: incommingvalue['fullName'],
            confirmPassword: incommingvalue['confirmPassword']);
      }
    } catch (e) {
      print(e);
    }

    return currentuser;
  }

// login User

  static Future<String> login(LoginModel loginModel) async {
    String finalvalue = "";

    try {
      final httpresponse = await http.post(
          Uri.parse('http://localhost:3500/api/LoginUser'),
          body: loginModel.tojson());

      if (httpresponse.statusCode == 200) {
        finalvalue = jsonDecode(httpresponse.body).toString();
      } else {
        finalvalue = "Invalid Credentials";
      }
    } catch (e) {
      print(e);
    }

    return finalvalue;
  }
}
