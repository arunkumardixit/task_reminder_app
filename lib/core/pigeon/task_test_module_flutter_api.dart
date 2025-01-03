

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:task_reminder_app/blocs/task_block.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import 'package:task_reminder_app/core/pigeon/task_test_module_pigeon.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

class TaskTestModuleFlutterAPI extends TaskTestModuleFlutter {
  final BuildContext _context;

  TaskTestModuleFlutterAPI({required BuildContext context}) : _context = context;

  @override
  void updateTask(NativeTaskConfig task) {
    _context.read<TaskBloc>().add(
        UpdateTaskEvent(Task( ObjectId(),task.title,task.description,"done",DateTime.now())
        )
    );
  }

}