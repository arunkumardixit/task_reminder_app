
import 'package:flutter_test/flutter_test.dart';
import 'package:realm/realm.dart';
import 'package:task_reminder_app/blocs/BlocStatus.dart';
import 'package:task_reminder_app/blocs/task_block.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import 'package:task_reminder_app/db/Repositories/ITaskRepository.dart';
import 'package:task_reminder_app/db/Repositories/TaskRepositoryMockData.dart';
import 'package:task_reminder_app/db/realm/RealmStorageInMemory.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

void main() {
  late TaskBloc taskBloc;
  ITaskRepository taskRepository = TaskRepositoryMockDB(RealmStorageInMemory());
  setUp(() {
    taskBloc = TaskBloc(taskRepository:  taskRepository );

  });

  test('Room initial state test ', () async {
    expect(taskBloc.state.status, BlocStatus.loading);
  });

  test('Task fetch test ', () async {
    taskBloc.add(FetchTasksEvent());
    expect(taskBloc.state.status, BlocStatus.loading);
    expect(taskBloc.state.tasks, null);
    await Future.delayed(const Duration(seconds: 4));
    expect(taskBloc.state.status, BlocStatus.success);
    expect(taskBloc.state.tasks?.length, 0);
  });

  test('Task Add test ', () async {
    taskBloc.add(FetchTasksEvent());
    expect(taskBloc.state.status, BlocStatus.loading);
    expect(taskBloc.state.tasks, null);
    Task task = Task(ObjectId(), "test", "test", "pending", DateTime.now());
    taskBloc.add(AddTaskEvent(task));
    await Future.delayed(const Duration(seconds: 4));
    expect(taskBloc.state.status, BlocStatus.success);
    expect(taskBloc.state.tasks?.length, 1);
  });


  tearDown((){
    taskBloc.close();
  });
}
