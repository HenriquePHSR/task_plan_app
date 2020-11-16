import 'package:flutter/material.dart';
import 'package:task_plan_app/services/subTask.dart';
import 'package:task_plan_app/services/task.dart';


class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    Task instance = ModalRoute.of(context).settings.arguments;

    return Scaffold();
  }
}
