
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_reminder_app/blocs/task_block.dart';
import 'package:task_reminder_app/blocs/task_event.dart';
import '../../routes/route_name.dart';

class SplashServices{

  void isLogin(BuildContext context){
   context.read<TaskBloc>().add(FetchTasksEvent ());
    Timer(const Duration(seconds: 3),()=>
        Navigator.pushNamedAndRemoveUntil(context, RouteName.route_home , (route) => false));
  }
}