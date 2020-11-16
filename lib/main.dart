import 'package:flutter/material.dart';
import 'package:task_plan_app/pages/loading.dart';
import 'package:task_plan_app/pages/Home.dart';
import 'package:task_plan_app/pages/taskDetail.dart';

void main() {
  runApp(MaterialApp(
    // TODO add finance control func and integrate to task
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    routes: {
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/task_detail': (context) => TaskDetail(),

    },
  ));
}
