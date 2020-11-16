import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_plan_app/services/task.dart';
import 'package:task_plan_app/services/User.dart';
import 'package:intl/intl.dart';

// this class receive a list of diferents tile layouts types to build

class MyCard extends StatefulWidget { // build a widget to display a task in home
  final Task task;
  final User user;
  MyCard({this.task, this.user});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                Text("  "+ DateFormat.yMEd().format(widget.task.createDate).toString()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 2),
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/task_detail', arguments: widget.task); // pass a task to build by taskDetail class
                    },
                    icon: Icon(
                      Icons.edit
                    ),
                    label: Text(widget.task.title),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 2),
                  child: FlatButton.icon(
                    onPressed: () {
                        widget.user.removeFromDayleTask(widget.task);
                    },
                    icon: Icon(
                        Icons.restore_from_trash
                    ),
                    label: Text(''),
                  ),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}

class taskGroupContainer extends StatefulWidget {
  List<Task> taskGroup;
  User user;
  @override
  taskGroupContainer({this.taskGroup, this.user});
  _taskGroupContainerState createState() => _taskGroupContainerState();
}

class _taskGroupContainerState extends State<taskGroupContainer> {

  @override
  Widget build(BuildContext context) {
    Widget wid =Column(
      children: widget.taskGroup.map((e) => MyCard(task: e, user: widget.user,)).toList(),
      // this iteration loop through a list of task and build a MyCard widget to which one
    );
    setState(() {

    });
    return wid;
  }
}



class HomeTileListBuilder extends StatefulWidget {
  ScrollController controllerPointer;
  String indexer;
  User user;
  @override
  HomeTileListBuilder(String i, User user, ScrollController controllerPointer) {
    this.indexer = i;
    this.user = user;
    this.controllerPointer = controllerPointer;
  }

  _HomeTileListBuilderState createState() => _HomeTileListBuilderState();
}

class _HomeTileListBuilderState extends State<HomeTileListBuilder> {

  @override
  Widget build(BuildContext context) {

    switch(widget.indexer) {
      case 'profileTile':
        { // check the tile layout type
          print(widget.indexer);
          return Padding(
            padding: const EdgeInsets.fromLTRB(130, 30, 100, 15),
            child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/img/wallpaper-2147.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.user.name,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    ),
                  ),

                ]
            ),
          );
        }
        break;
      case 'taskTitleTypeDaily':
        {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Text(
              'Daly Tasks:',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'Roboto',
              ),
            ),
          );
        }
        break;

      case 'profileTaskDaily':
        {

          return taskGroupContainer(taskGroup: widget.user.myDailyTasks, user: widget.user);
        }
        break;

      case 'taskTitleTypeWeekly':
        {
          return Text(
            'Weekly Tasks:',
            style: TextStyle(
              fontSize: 32,
            ),
          );
        }
        break;

      case 'profileTaskWeekly':
        {
          return taskGroupContainer(taskGroup: widget.user.myWeeklyTasks);
        }
        break;
      case 'taskTitleTypeMonthly':
        {
          return Text(
            'Month Tasks:',
            style: TextStyle(
              fontSize: 32,
            ),
          );
        }
        break;

      case 'profileTaskMonthly':
        {
          return taskGroupContainer(taskGroup: widget.user.myMonthlyTasks);
        }
        break;
      case 'taskTitleTypeYear':
        {
          return Text(
            'Year Tasks:',
            style: TextStyle(
              fontSize: 32,
            ),
          );
        }
        break;

      case 'profileTaskYear':
        {
          return taskGroupContainer(taskGroup: widget.user.myYearTasks);
        }
        break;
      case 'taskTitleTypeLongTerm':
        {
          return Text(
            'Long Term Tasks:',
            style: TextStyle(
              fontSize: 32,
            ),
          );
        }
        break;

      case 'profileTaskLongTerm':
        {
          return taskGroupContainer(taskGroup: widget.user.myLongTermTask);
        }
        break;
      default: {
        return Container();
      }

    }

  }
}
