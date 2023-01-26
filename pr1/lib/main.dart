// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pr1/lop.dart';
import 'package:pr1/qsp.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primaryColor: Colors.orange,
        // primarySwatch: Colors.black45 ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LogoPage.id,
      routes: AppRoutes.routes(),
    );
  }
}

class AppRoutes {
  static Map<String, WidgetBuilder> routes() {
    return {
      LogoPage.id: (context) => LogoPage(),
      QuestionsPage.id: (context) => QuestionsPage(),
    };
  }
}
