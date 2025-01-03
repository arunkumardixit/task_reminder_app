
import 'package:flutter/material.dart';
import 'package:task_reminder_app/Views/home_view/home_view_widget.dart';
import 'package:task_reminder_app/Views/splash_view/splash_view.dart';
import 'package:task_reminder_app/Views/task_views/task_view_widget.dart';
import 'package:task_reminder_app/db/realm/schemas.dart';
import 'package:task_reminder_app/routes/route_name.dart';

class ApplicationRoute {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.route_splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RouteName.route_home:
        return MaterialPageRoute(builder: (context) => const HomeViewWidget());
      case RouteName.route_task_view_edit:
        return MaterialPageRoute(builder: (context) => TaskViewWidget(task: settings.arguments != null? settings.arguments as Task: null));
      // // case RouteName.route_login:
      //   return MaterialPageRoute(builder: (context) => const LoginScreen());
      // case RouteName.route_item:
      //   return MaterialPageRoute(builder: (context) => const ItemsScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: const Center(child: Text("Error in Routes")),
          );
        });
    }
  }
}
