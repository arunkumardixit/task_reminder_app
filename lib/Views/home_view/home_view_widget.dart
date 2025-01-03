import 'package:flutter/material.dart';
import 'package:task_reminder_app/Views/task_views/task_list_widget.dart';
import 'package:task_reminder_app/routes/route_name.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("Task Reminder App"),
        actions: [
          IconButton(onPressed: () => {

          Navigator.pushNamed(context, RouteName.route_task_view_edit)

          }, icon: const Icon(Icons.add)),
        ],
      ),
      body: const TaskListWidget()
    );
  }
}
