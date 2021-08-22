import 'package:frontend/DataProvider/Schedule/Schedules.dart';
import 'package:frontend/Models/Schedule.dart';

class SchedulesRepository {
  static Future<dynamic> allScheduleRepo() async {
    print("passed Schedule  repo");
    return await SchedulesDataProvovider.getAllSchedules();
  }
}
