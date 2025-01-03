import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:realm/realm.dart';
import 'package:task_reminder_app/TaskRemiderAppWidget.dart';
import 'package:task_reminder_app/db/Repositories/TaskRepositoryDB.dart';
import 'package:task_reminder_app/db/realm/RealmStorage.dart';
import 'package:task_reminder_app/routes/route_name.dart';

import 'db/Repositories/ITaskRepository.dart';
import 'db/realm/schemas.dart';


GetIt getIt = GetIt.instance;
void main() {
  final config = Configuration.local([Task.schema]);
  final realm = Realm(config);  // Open a Realm instance
  servicesLocator();
  runApp(const TaskReminderAppWidget());
  WidgetsFlutterBinding.ensureInitialized();
  askPermission();

}
void askPermission() async {
   Permission.notification.request();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  }
  );
 await Permission.notification.isGranted.then((value) {
    if (kDebugMode) {
      print("granted");
    }
  });
}


servicesLocator() {
  getIt.registerLazySingleton<ITaskRepository>(() =>  TaskRepositoryDB(RealmStorage()),
      instanceName: RouteName.route_home);
}
