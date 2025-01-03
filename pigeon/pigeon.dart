
import 'package:pigeon/pigeon.dart';

// To generate Pigeon files, run:
// flutter pub run pigeon --input pigeon/pigeon.dart

@ConfigurePigeon(
  PigeonOptions(
    dartOut: "lib/core/pigeon/task_test_module_pigeon.dart",
    swiftOut: "ios/Runner/TaskTestModuleNativeProtocol.swift",
    javaOut: './android/app/src/main/java/dev/ad/pigeon/TaskTestModuleNativeInterface.java',
    javaOptions: JavaOptions(
      package: "com.example.task_reminder_app",
    ),

  ),
)

/// Flutter -> Native communication
/// Requires implementation on Native side
@HostApi()
abstract class TaskTestModuleNative {
  void addNotification(NativeTaskConfig task);
}

@FlutterApi()
abstract class TaskTestModuleFlutter {
  void updateTask(NativeTaskConfig task);
}

class NativeTaskConfig {
  final String reminderTime;
  final String title;
  final String description;
  final int hour;
  final int minute;

  NativeTaskConfig(
      this.reminderTime,
      this.title,
      this.description,
      this.hour,
      this.minute
  );
}

