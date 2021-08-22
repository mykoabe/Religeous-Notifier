import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/Models/Schedule.dart';

class SchedulesDataProvovider {
  static Future<dynamic> getAllSchedules() async {
    dynamic schedules;

    try {
      final httpresponse = await http.get(
        Uri.parse('http://localhost:3500/api/getallSchedules'),
      );

      if (httpresponse.statusCode == 200) {
        var finalresult = jsonDecode(httpresponse.body);
        schedules = finalresult['Schedules'];
        // print(finalresult['Schedules']);
      }
    } catch (e) {}

    return schedules;
  }
}
