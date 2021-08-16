import 'package:frontend/DataProvider/Schedule/Schedules.dart';
import 'package:frontend/Models/Schedule.dart';

class SchedulesRepository {
  static Future<dynamic> allScheduleRepo() async {
    print("passed Schedule  repo");
    return await SchedulesDataProvovider.getAllSchedules();
  }
 static Future<User> register(User user) async {
    User getCurrentUser = User("", "");
    try {
      final httpresponse = await http.post(
          Uri.parse('http://localhost:3500/api/RegisterUser'),
          body: user.tojson());
      if (httpresponse.statusCode == 201) {
        var incommingvalue = jsonDecode(httpresponse.body);
        getCurrentUser = User(
          incommingvalue['emailAddress'],
          incommingvalue['password'],
          userName: incommingvalue['userName'],
          fullName: incommingvalue['fullName'],
          confirmPassword: incommingvalue['confirmPassword'],
        );
      }

      print("passed dataprovider");
    } catch (e) {
      print(e.toString());
    }

    return getCurrentUser;
  }

  static Future<dynamic> createSchedule(Schedule schedule) async {
    print("passed Schedule  repo");
    return await SchedulesDataProvovider.createSchedule(schedule);
  }
}
