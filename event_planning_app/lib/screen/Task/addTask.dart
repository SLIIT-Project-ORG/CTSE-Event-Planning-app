import 'package:dropdown_search/dropdown_search.dart';
import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/model/Task.dart';
import 'package:event_planning_app/screen/Task/viewTask.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../repository/TaskRepo.dart';

class AddTask extends StatelessWidget {
  // const AddTask({super.key});

  final TaskRepo _taskRepository = TaskRepo();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String priority = "";
  String assignTo = "";
  String status = "";
  String date = "";

  void _saveTask() async {
    // Create a new package object from the user input
    Task task = Task(
      taskName: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      priority: priority.toString(),
      dueDate: DateTime.now().toString(),
      assignTo: assignTo.toString(),
      status: status.toString(),
      note: _noteController.text.trim(),
    );

    // Call the addTask() method from the repository to save the Task to Firebase
    await _taskRepository.addTask(task);
    print("Saved");
    print(task);
    // Navigate back to the previous screen
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task '),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Task/images/task.png'),
            alignment: Alignment.centerLeft,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Center(
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _nameController,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Task Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null) {
                        return 'please enter task name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _descriptionController,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Priority',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    items:
                        <String>['High', 'Medium', 'Low'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      priority = value.toString();
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Assign To',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    items: <String>['001 Team', '002 Team', '003Team']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      assignTo = value.toString();
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    items: <String>['Not started', 'In progress', 'Completed']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      status = value.toString();
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _noteController,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Note',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: _saveTask,
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ViewTask()),
                    // );
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          // Handle the click event here
                        },
                        child: const Text(
                          'Add new Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewTask()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow[900],
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewTask(),
                              ));
                        },
                        child: const Text(
                          'View All Task',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
