import 'package:intl/intl.dart';
import 'package:task_plan_app/services/User.dart';

class Task {
  String title;
  User proprietary;
  bool status;
  String repeatMode;
  int subTasksLength;
  double taskExpenses;
  DateTime createDate;

  Task(String title, String repeatMode) {
    this.title = title;
    this.status = false;
    this.repeatMode = repeatMode;
    this.proprietary = User(name: 'John Doe');
    this.createDate = DateTime.now();
  }

  void completeTask() {
    this.status = true;
  }

  void addSubTask() {
    // TODO add subtask to a task
  }

  void checkRepeatMode() {
    // TODO define logic for repeat mode
    DateTime now = DateTime.now();

  }

  // TODO define getters and setters

}