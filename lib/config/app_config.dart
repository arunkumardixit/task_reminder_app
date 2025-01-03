
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class ApplicationConfig {
  // static getScreenWidth(BuildContext context) {
  //   double width = MediaQuery
  //       .sizeOf(context)
  //       .width;
  //   if (kDebugMode) {
  //     print("width=$width");
  //   }
  //   return width;
  // }

  static isForTab(BuildContext context){
    double width = MediaQuery
        .sizeOf(context)
        .width;
    if (kDebugMode) {
      print("width=$width");
    }
    return width>1200;
  }
}