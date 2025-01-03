
import 'package:equatable/equatable.dart';
import 'package:task_reminder_app/blocs/selection_status.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

import 'BlocStatus.dart';

class TasksState extends Equatable {
  final List<Task>? tasks;
  final List<Task> tempTasks;
  final Task? task;
  final String message;
  final BlocStatus? status;
  const TasksState({ this.tasks  ,this.tempTasks = const [], this.message = "", this.task, this.status = BlocStatus.loading});

  @override
  List<Object?> get props => [tasks,message,task,tempTasks,status];

  TasksState copyWith({  String? message,
    List<Task>? tempTasks,
    List<Task>? tasks,
    BlocStatus? status,
    Task? task,
    SelectionStatusEnum? selectionStatus}) {

    return TasksState(
        message: message??this.message,
        tempTasks: tempTasks??this.tempTasks,
        tasks: tasks??this.tasks,
        status: status??this.status,
        task: task??this.task);
  }
}

