
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTasksEvent extends TaskEvent {
  FetchTasksEvent();
}

class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);
  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  DeleteTaskEvent(this.task);
  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final Task task;
  UpdateTaskEvent(this.task);
  @override
  List<Object?> get props => [task];
}