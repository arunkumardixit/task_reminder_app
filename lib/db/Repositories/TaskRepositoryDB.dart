import 'package:objectid/src/objectid/objectid.dart';
import 'package:task_reminder_app/db/Repositories/ITaskRepository.dart';
import 'package:task_reminder_app/db/realm/ILocalRealmStorage.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

class TaskRepositoryDB implements ITaskRepository {
  final ILocalRealmStorage _localStorage;

  const TaskRepositoryDB(this._localStorage);

  @override
  Future<Task> addTask(Task task) async {
    return await _localStorage.add(task);
  }

  @override
  Future<List<Task>> getAllTasks() async {
    return _localStorage.getAll<Task>().toList();
  }

  @override
  Future<void> addMultipleTasks(List<Task> tasks) async {
    await _localStorage.addList(tasks);
  }

  @override
  Future<void> deleteTask(Task task) async {
    await _localStorage.delete(task);
  }

  @override
  Future<void> updateTask(Task task) async {
    await _localStorage.update(task);
  }

}