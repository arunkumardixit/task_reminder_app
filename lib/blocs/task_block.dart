
import 'package:bloc/bloc.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import 'package:task_reminder_app/blocs/task_state.dart';
import 'package:task_reminder_app/db/Repositories/ITaskRepository.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

import 'BlocStatus.dart';

class TaskBloc extends Bloc<TaskEvent,TasksState> {
  ITaskRepository taskRepository;

  TaskBloc({required this.taskRepository}):super(const TasksState(

  )){
    on<FetchTasksEvent>(_fetchTasks);
    on<AddTaskEvent>(_addTasks);
    on<UpdateTaskEvent>(_updateTasks);

  }

  _fetchTasks(FetchTasksEvent event,Emitter<TasksState> emit) async {
    List<Task> list = await taskRepository.getAllTasks();

    emit(state.copyWith(status: BlocStatus.success,tasks: list));
  }

  _addTasks(AddTaskEvent event,Emitter<TasksState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));
    Task task = await taskRepository.addTask(event.task);
    List<Task> list = await taskRepository.getAllTasks();
    emit(state.copyWith(status: BlocStatus.success,tasks: list));
  }
  _updateTasks(UpdateTaskEvent event, Emitter<TasksState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));
    List<Task> list = await taskRepository.getAllTasks();
    Task updatedTask = list.firstWhere((element) => element.title == event.task.title);
    updatedTask.status = "done";
    emit(state.copyWith(status: BlocStatus.success));
  }
}