import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_reminder_app/services/splash/splash_services.dart';

import '../../components/loading_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  late SplashServices _services ;
  @override
  void initState() {
    super.initState();
    _services = SplashServices();
    _services.isLogin(context);

  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Task Reminder App",
        style: Theme.of(context).textTheme.headlineLarge,),
        const LoadingWidget()
      ],
    ));
  }
}
