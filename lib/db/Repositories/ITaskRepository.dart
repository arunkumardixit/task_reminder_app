
import 'package:task_reminder_app/db/realm/schemas.dart';

abstract class ITaskRepository {
  Future<Task> addTask(Task task);

  Future<List<Task>> getAllTasks();

  Future<void> deleteTask(Task task);

  Future<void> addMultipleTasks(List<Task> tasks);

  Future<void> updateTask(Task task);


}