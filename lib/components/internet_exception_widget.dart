import 'package:flutter/material.dart';
import 'package:task_reminder_app/components/round_button.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
               Icons.cloud_off,
            color: Colors.red,
            size: 50,
           ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("No internet connection.\nPlease try again")),
          ),
          const SizedBox(height: 20,),
          RoundButton(onPress: onPress,title: "Retry",)

        ],
      ),
    );
  }
}
