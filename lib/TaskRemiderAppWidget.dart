import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_app/config/themes/dark_theme.dart';
import 'package:task_reminder_app/config/themes/light_theme.dart';
import 'package:task_reminder_app/routes/application_route.dart';
import 'package:task_reminder_app/routes/route_name.dart';

import 'blocs/task_block.dart';
import 'main.dart';

class TaskReminderAppWidget extends StatelessWidget {
  const TaskReminderAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(
              taskRepository: getIt.get(instanceName: RouteName.route_home)),
        ),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      // Setting theme mode to dark
      theme: lightTheme,
      // Setting light theme
      darkTheme: darkTheme,
      initialRoute: RouteName.route_splash,
      onGenerateRoute: ApplicationRoute.routeGenerator,
      ),
    );
  }
}
