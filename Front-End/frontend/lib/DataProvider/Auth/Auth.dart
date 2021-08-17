import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:frontend/Models/User.dart';
import 'package:frontend/Models/LoginModel.dart';

//Genymotion emulator address 192.168.60.1

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

  static Future<Map<String, dynamic>> login(LoginModel loginModel) async {
    var finalvalue;

    try {
      final httpresponse = await http.post(
          Uri.parse('http://localhost:3500/api/LoginUser'),
          body: loginModel.tojson());

      if (httpresponse.statusCode == 200) {
        finalvalue = jsonDecode(httpresponse.body);
      } else if (httpresponse.statusCode == 400) {
        finalvalue = jsonDecode(httpresponse.body);
      }
    } catch (e) {
      print(e);
    }

    return finalvalue;
  }

  static Future<String> deleteaccount(User user) async {
    var result = "";

    try {
      //  final httpresponse = await http.delete(
      //     Uri.parse('http://localhost:3500/api/DeleteProfile'),
      //     body: user.tojson()
      //     ,
      //     headers: );

    } catch (e) {}
    return result;
  }
}
