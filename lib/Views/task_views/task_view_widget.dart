import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realm/realm.dart';
import 'package:task_reminder_app/blocs/task_block.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import 'package:task_reminder_app/core/pigeon/task_test_module_pigeon.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';
import 'package:intl/intl.dart';

class TaskViewWidget extends StatefulWidget {
  final Task? task;

  const TaskViewWidget({super.key, this.task});

  @override
  _TaskViewWidgetState createState() => _TaskViewWidgetState();
}

class _TaskViewWidgetState extends State<TaskViewWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";

  DateTime reminderDateTime = DateTime.now();
  late TimeOfDay _reminderTime;
  DateTime _reminderDate = DateTime.now();

  String description = "";

  @override
  void initState() {
    super.initState();
    _reminderTime =
        TimeOfDay(hour: reminderDateTime.hour, minute: reminderDateTime.minute);
    setReminderDateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  TaskTestModuleNative().addNotification(NativeTaskConfig(
                      reminderTime: reminderDateTime.toString(),
                      title: title,
                      description: description,
                      hour: reminderDateTime.hour,
                      minute: reminderDateTime.minute));

                  context.read<TaskBloc>().add(AddTaskEvent(Task(ObjectId(),
                      title, description, "pending", reminderDateTime)));
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Title:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      title = value;
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a title' : null,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                    validator: (value) => value!.isEmpty
                        ? 'Please enter a task description'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Reminder Time",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onTap: () async {
                      _selectTime(context);
                    },
                    controller: TextEditingController(
                      text: _reminderTime == null
                          ? ''
                          : _reminderTime.format(context),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please pick a reminder time' : null,
                  ),
                  const SizedBox(height: 16),
                  // const Text(
                  //   "Reminder Date",
                  //   style: TextStyle(
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // const SizedBox(height: 8),
                  // TextFormField(
                  //   readOnly: true,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.grey[200],
                  //   ),
                  //   onTap: () async {
                  //     _selectDate(context);
                  //
                  //   },
                  //   controller: TextEditingController(
                  //       text: DateFormat("yyyy-MM-dd").format(_reminderDate)
                  //   ),
                  //   validator: (value) =>
                  //   value!.isEmpty ? 'Please pick a reminder date' : null,
                  // ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskTestModuleNative().addNotification(
                              NativeTaskConfig(
                                  reminderTime: reminderDateTime.toString(),
                                  title: title,
                                  description: description,
                                  hour: reminderDateTime.hour,
                                  minute: reminderDateTime.minute));

                          context.read<TaskBloc>().add(AddTaskEvent(Task(
                              ObjectId(),
                              title,
                              description,
                              "pending",
                              reminderDateTime)));
                          Navigator.of(context).pop();
                        }
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final ThemeData theme = Theme.of(context);

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialTimePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoTimePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialTimePicker(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _reminderTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _reminderTime) {
      setState(() {
        _reminderTime = pickedTime;
        setReminderDateTime();
      });
    }
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoTimePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.time,
              onDateTimeChanged: (picked) {
                setState(() {
                  _reminderTime = TimeOfDay.fromDateTime(picked);
                  setReminderDateTime();
                });
              },
              initialDateTime: reminderDateTime,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _reminderDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _reminderDate) {
      setState(() {
        _reminderDate = picked;
        setReminderDateTime();
      });
    }
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != _reminderDate) {
                  setState(() {
                    _reminderDate = picked;
                    setReminderDateTime();
                  });
                }
              },
              initialDateTime: _reminderDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  setReminderDateTime() {
    final taskDateTime = DateTime(_reminderDate.year, _reminderDate.month,
        _reminderDate.day, _reminderTime!.hour, _reminderTime!.minute, 0, 0, 0);
    reminderDateTime = taskDateTime;
  }
}
