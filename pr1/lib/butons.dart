import 'package:flutter/material.dart';
import 'package:pr1/qsp.dart';
Container customChoicesButton({
  required EdgeInsetsGeometry buttonPadding,
  required Function() onPressed,
  required String text,

}) {
  return Container(
    child: Padding(
      padding: buttonPadding,
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          width: double.maxFinite,
          height: 50,
          color: Colors.amberAccent,
          child: Padding(
            padding:const EdgeInsets.all(2.0),
            child: Center(
              child: Text(

                text,
                textAlign: TextAlign.center,
                style:

                   TextStyle(
                     color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,

                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


Container customStartButton({required BuildContext context}) {
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, QuestionsPage.id);
        },
        child: Container(
          width: 256,
          height: 256,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/start.png'),

            ),
          ),
        ),
      ),
    ),
  );
}
