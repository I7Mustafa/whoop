import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void showToast(BuildContext context, String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Theme.of(context).cardColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      textColor: Theme.of(context).iconTheme.color,
    );
  }
}
