
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert customAlert({
  required String title,
  required String desc,
  required String text,
  required Function() onPressed,
  required BuildContext context,
}) {
  return Alert(
      context: context,
      title: title,
      desc: desc,
      style: const AlertStyle(

        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          color: Colors.blue,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ]);
}
