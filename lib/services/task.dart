import 'package:intl/intl.dart';
import 'package:task_plan_app/services/User.dart';
import 'package:task_plan_app/services/subTask.dart';

class Task {
  String title;
  User proprietary;
  List<Subtask> subTasks;
  bool status;
  String repeatMode;
  int subTasksLength;
  double taskExpenses;
  DateTime createDate;

  Task(String title, String repeatMode) {
    this.title = title;
    this.subTasks = [
      Subtask(title: 'delete me 1', status: false, subTaskExpenses: 10.0),
      Subtask(title: 'delete me 2', status: false, subTaskExpenses: 12.5),
      Subtask(title: 'delete me 3', status: false, subTaskExpenses: 10.0),
      Subtask(title: 'delete me 4', status: false, subTaskExpenses: 12.5),
      Subtask(title: 'delete me 5', status: false, subTaskExpenses: 10.0),
      Subtask(title: 'delete me 6', status: false, subTaskExpenses: 12.5),
      Subtask(title: 'delete me 7', status: false, subTaskExpenses: 10.0),
      Subtask(title: 'delete me 8', status: false, subTaskExpenses: 12.5),
      Subtask(title: 'delete me 9', status: false, subTaskExpenses: 7.25)
    ];
    this.status = false;
    this.repeatMode = repeatMode;
    this.proprietary = User(name: 'John Doe');
    this.createDate = DateTime.now();

    calcTaskExpenses();
  }

  void completeTask() {
    this.status = true;
  }

  void calcTaskExpenses() {
    double total = 0.0;
    for (var i = 0; i < this.subTasks.length; i++) {
      total += this.subTasks[i].subTaskExpenses;
    }
    this.taskExpenses = total;
  }

  void addSubTask() {
    // TODO add subtask to a task
  }

  void removeSubTask(title) {
    for (var i = 0; i < this.subTasks.length; i++) {
      if (this.subTasks[i].title == title) {
        this.subTasks.remove(i);
      }
    }
  }

  void completeSubTask(title) {
    int j = 0;
    for (var i = 0; i < this.subTasks.length; i++) {
      if (this.subTasks[i].title == title) {
        if (this.subTasks[i].status) {
          this.subTasks[i].status = false;
        } else {
          this.subTasks[i].status = true;
        }

      }
      if (this.subTasks[i].status) {
        j += 1;
      }
    }
    if (j == this.subTasks.length) {
      this.status = true;
    } else {
      this.status = false;
    }

  }

  void checkRepeatMode() {
    // TODO define logic for repeat mode
    DateTime now = DateTime.now();

  }

  // TODO define getters and setters

}