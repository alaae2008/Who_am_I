// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Column currentGameInfo({required String info}) {
  return Column(
    children: [

      Container(
        width: 100,
        height: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/infoBorder.png'),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(.5),
          child: Center(
            child: Text(
              info,
              style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                color: Colors.amberAccent,),
            ),
          ),
        ),
      ),
    ],
  );
}
