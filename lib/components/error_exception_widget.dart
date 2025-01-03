import 'package:flutter/material.dart';
import 'package:task_reminder_app/components/round_button.dart';

class ErrorExceptionWidget extends StatelessWidget {
  final String errorText;
  final VoidCallback onPress;
  const ErrorExceptionWidget({super.key, required this.onPress, required this.errorText});

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
            Icons.error,
            color: Colors.red,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(errorText)),
          ),
          const SizedBox(height: 20,),
          RoundButton(onPress: onPress,title: "Retry",)

        ],
      ),
    );
  }
}
