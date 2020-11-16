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

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: instance.subTasks.length,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Column(
                children: <Widget>[
                  Text(instance.title),
                  Container(
                    decoration: BoxDecoration(
                      color: instance.subTasks[i].status ? Colors.blueAccent : Colors.redAccent[200],
                    ),
                    child: Column(

                        children: <Widget>[
                          Center(child: Text(instance.subTasks[i].title)),
                          Text(instance.subTasks[i].description),
                          Text(instance.subTasks[i].subTaskExpenses.toString()),
                        ]
                    ),
                  ),

                  FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        instance.completeSubTask(instance.subTasks[i].title);

                      });
                    },
                    label: Text(
                      'Complete task',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),

                ],

              );
            } else {
              return Column(
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: instance.subTasks[i].status ? Colors.blueAccent : Colors.redAccent[200],
                    ),
                    child: Column(

                        children: <Widget>[ Center(child:
                          Text(instance.subTasks[i].title)),
                          Text(instance.subTasks[i].description),
                          Text(instance.subTasks[i].subTaskExpenses.toString()),
                        ]
                    ),
                  ),

                  FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        instance.completeSubTask(instance.subTasks[i].title);
                      });
                    },
                    label: Text(
                      'Complete task',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),

                ],

              );
            };


          },
        ),
      ),
    );
  }
}
