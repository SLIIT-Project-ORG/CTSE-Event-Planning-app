import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/model/Task.dart';
import 'package:event_planning_app/repository/TaskRepo.dart';
import 'package:event_planning_app/screen/Task/updatetask.dart';
import 'package:flutter/material.dart';

class ViewTask extends StatelessWidget {
  TaskRepo taskRepo = TaskRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Task'),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder<List<Task>>(
          stream: taskRepo.getTaskList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            List<Task> tasks = snapshot.data!;
            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 236, 233),
                    border: Border.all(width: 0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                      ListTile(
                        title: Text(task.taskName!),
                        textColor: Colors.black,
                        subtitle: Text(task.priority!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              color: Color.fromARGB(255, 34, 172, 71),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Update Task'),
                                      content: Text(
                                          'Are you sure you want to Update ${task.taskName}?'),
                                      actions: [
                                        TextButton(
                                          child: Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('UPDATE'),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateTask(id: task.id!)),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                                // TODO: implement update function
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Delete Task'),
                                      content: Text(
                                          'Are you sure you want to delete ${task.taskName}?'),
                                      actions: [
                                        TextButton(
                                          child: Text('CANCEL'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('DELETE'),
                                          onPressed: () async {
                                            await taskRepo
                                                .deleteTask(task.id.toString());
                                            Navigator.of(context).pop();
                                            print("Click Delete");
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
