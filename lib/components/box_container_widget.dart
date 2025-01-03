import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxContainerWidget extends StatelessWidget {
  final VoidCallback? onSelect;
  final Widget childWidget;
  final Color? color;
  const BoxContainerWidget({super.key, this.onSelect, required this.childWidget, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onSelect != null){
          onSelect!();
        }
      },
      child: Card(
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              )),
          child: childWidget,
        ),
      ),
    );
  }
}
