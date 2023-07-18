
import 'package:flutter/material.dart';

class CustomSnackBar {
  final bool error;
  final String text;
  final BuildContext context;
  CustomSnackBar({
    required this.context,
   required this.error,
   required  this.text,
  }
  );

  void showSnackbar(){
   
    ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text),
     backgroundColor:error ? 
   Colors.red : Colors.green, 
    behavior: SnackBarBehavior.floating,));
  } 
}
