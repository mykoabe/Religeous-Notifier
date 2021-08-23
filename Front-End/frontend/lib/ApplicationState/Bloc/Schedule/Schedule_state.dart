import 'package:equatable/equatable.dart';
import 'package:frontend/Models/Schedule.dart';

class ScheduleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingSchedules extends ScheduleState {}

class OnScheduleLoadSuccess extends ScheduleState {
  List<dynamic> allschedules;

  OnScheduleLoadSuccess(this.allschedules);

  @override
  List<Object?> get props => [allschedules];
}

class FaildLoadingSchedules extends ScheduleState {}

class AddingSchedule extends ScheduleState {}

class AddedSchedule extends ScheduleState {}

class FailedtoAddSchedule extends ScheduleState {}
