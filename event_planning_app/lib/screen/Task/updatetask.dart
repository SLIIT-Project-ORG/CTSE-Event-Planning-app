import 'package:event_planning_app/constant.dart';
import 'package:event_planning_app/model/Task.dart';
import 'package:event_planning_app/repository/TaskRepo.dart';
import 'package:event_planning_app/screen/Task/viewTask.dart';

import 'package:flutter/material.dart';

class UpdateTask extends StatelessWidget {
  TaskRepo taskRepo = TaskRepo();

  String id;
  UpdateTask({super.key, required this.id});

  //GetBy Id
  // Future<Task?> task = taskRepo.getTask(id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Task '),
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
            image: AssetImage('assets/Task/images/update.png'),
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
                    onChanged: (String? value) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Due Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          var _selectedDate;
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDate != null
                                ? _selectedDate
                                : DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'please enter  Date';
                      }

                      return null;
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
                    onChanged: (String? value) {},
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
                    onChanged: (String? value) {},
                  ),
                  SizedBox(height: 20),
                  TextFormField(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewTask()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          // Handle the click event here
                        },
                        child: Text(
                          'Update Task',
                          style: TextStyle(
                            color: Color.fromARGB(255, 165, 219, 190),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
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
