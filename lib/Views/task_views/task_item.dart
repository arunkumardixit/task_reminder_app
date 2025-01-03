import 'package:flutter/material.dart';
import 'package:task_reminder_app/components/box_container_widget.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;
  const TaskItemWidget({super.key,  required this.task });

  @override
  Widget build(BuildContext context) {
    return BoxContainerWidget(
      childWidget:

      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title: #${task.title}", style: Theme
                .of(context)
                .textTheme
                .headlineSmall,),
            Text("Description: ${task.description}", style: Theme
                .of(context)
                .textTheme
                .bodyLarge,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Status: ${task.status}",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge,),
                IconButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Delete Functionality In Progress"),
                    ));
                  },
                  icon: const Icon(Icons.delete),
                  color: task.status == "inProgress" || task.status == "pending"?Colors.redAccent:Colors.lightGreen,)
              ],
            ),
          ]

      ), onSelect: () {},
    );
  }
}
