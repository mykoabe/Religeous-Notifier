import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Repository/SchedulesRepository.dart';
import 'package:frontend/Models/Schedule.dart';
import 'Schedule_event.dart';
import 'Schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleState());

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    //LoadingScheduleEvent

    if (event is LoadingScheduleEvent) {
      yield LoadingSchedules();
      try {
        dynamic incommingvalue = await SchedulesRepository.allScheduleRepo();
        print(incommingvalue);

        yield OnScheduleLoadSuccess(incommingvalue);
      } catch (e) {
        FaildLoadingSchedules();
        ;
      }
    }

    //AddingScheduleEvent

    if (event is AddingScheduleEvent) {
      yield AddedSchedule();
      try {
        var responsemessage =
            await SchedulesRepository.createSchedule(event.schedule);

        print(responsemessage.toString());
      } catch (e) {
        yield FailedtoAddSchedule();
      }
    }
  }
}
