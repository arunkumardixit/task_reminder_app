import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TCAppBar extends StatelessWidget {
  final Icon titleIcon;
  final String title;
  final Widget extensionWidget;
  TCAppBar({super.key, required this.title, required this.titleIcon, required this.extensionWidget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      toolbarHeight: 50.0 + kToolbarHeight,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              titleIcon,
              Text(title),
              // IconButton(
              //   icon: const Icon(
              //     Icons.notifications,
              //     color: Colors.white,
              //   ),
              //   onPressed: () {},
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              bottom: 12.0,
              left: 8.0,
              right: 8.0,
            ),
            child: extensionWidget,
          ),
        ],
      ),

      centerTitle: true,
      backgroundColor: Colors.red,
      pinned: true,);
  }
}
