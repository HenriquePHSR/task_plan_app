import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_plan_app/services/task.dart';
import 'package:task_plan_app/services/homeTileListBuilder.dart';
import 'package:task_plan_app/services/User.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _controller = new ScrollController();

  // TODO define a user profile create screen
  // TODO define to secondary memory save logic
  // TODO define task and subtask add and remove functions
  User instance = User(name:"John")

  List<String> homeTileListLayout = [
    'profileTile',
    'taskTitleTypeDaily',
    'profileTaskDaily',
    'taskTitleTypeWeekly',
    'profileTaskWeekly',
    'taskTitleTypeMonthly',
    'profileTaskMonthly',
    'taskTitleTypeYear',
    'profileTaskYear',
    'taskTitleTypeLongTerm',
    'profileTaskLongTerm',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),// TODO AppBar
      drawer: Drawer(

      ),// TODO Drawer
      body:ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: homeTileListLayout.length,
            itemBuilder: (context, i) {

              return Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200]
                  ),
                  child: HomeTileListBuilder(homeTileListLayout[i], instance, _controller)
              );
            }

      ),
    );
  }
}
