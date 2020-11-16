import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:task_plan_app/services/task.dart';

class User {
  String name;
  DateTime birthDate;
  List<Task> myDailyTasks;
  List<Task> myWeeklyTasks;
  List<Task> myMonthlyTasks;
  List<Task> myYearTasks;
  List<Task> myLongTermTask;

  // constructor
  User({
    this.name,
    this.myDailyTasks,
    this.myWeeklyTasks,
    this.myMonthlyTasks,
    this.myYearTasks,
    this.myLongTermTask
  });

  void removeFromDayleTask(Task task) {
    myDailyTasks.remove(task);
  }
  // TODO define getters and setters
}

