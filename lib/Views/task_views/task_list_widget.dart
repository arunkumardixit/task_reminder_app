import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_app/Views/task_views/task_item.dart';
import 'package:task_reminder_app/blocs/BlocStatus.dart';
import 'package:task_reminder_app/blocs/task_block.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import 'package:task_reminder_app/blocs/task_state.dart';
import 'package:task_reminder_app/components/error_exception_widget.dart';
import 'package:task_reminder_app/components/loading_widget.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TaskBloc, TasksState>(
      buildWhen: (current, previous) =>
      current.status != previous.status,
      builder: (context, state) {
        switch (state.status) {
          case BlocStatus.loading:
          case BlocStatus.success:
            return CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      Task? task = state.tasks?[index];
                      if(task != null){
                        return TaskItemWidget(task: task);
                      } else {
                        return ErrorExceptionWidget(onPress: () {
                          context.read<TaskBloc>().add(FetchTasksEvent());
                        }, errorText: "Some Error Occured",

                        );
                      }

                    }, childCount: state.tasks?.length))
              ],
            );;
          case BlocStatus.failure:
            return ErrorExceptionWidget(onPress: () {
              context.read<TaskBloc>().add(FetchTasksEvent());
            }, errorText: state.message,

            );
          case BlocStatus.noDataFound:
            return ErrorExceptionWidget(onPress: () {
              context.read<TaskBloc>().add(FetchTasksEvent());
            }, errorText: "No Data Found",

            );
          default:
            return ErrorExceptionWidget(onPress: () {
              context.read<TaskBloc>().add(FetchTasksEvent());
            }, errorText: "Some Error Occured",

            );
        }


      },
    );
  }
}
