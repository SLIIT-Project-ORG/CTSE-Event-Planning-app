import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? taskName;
  String? description;
  String? priority;
  String? dueDate;
  String? assignTo;
  String? status;
  String? note;

  Task(
      {this.id,
      this.taskName,
      this.description,
      this.priority,
      this.dueDate,
      this.assignTo,
      this.status,
      this.note});

  Task.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.id,
        taskName = (snapshot.data() as Map<String, dynamic>)["taskName"],
        description = (snapshot.data() as Map<String, dynamic>)["description"],
        priority = (snapshot.data() as Map<String, dynamic>)["priority"],
        dueDate = (snapshot.data() as Map<String, dynamic>)["dueDate"],
        assignTo = (snapshot.data() as Map<String, dynamic>)["assignTo"],
        status = (snapshot.data() as Map<String, dynamic>)["status"],
        note = (snapshot.data() as Map<String, dynamic>)["note"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'taskName': taskName,
        'description': description,
        'priority': priority,
        'dueDate': dueDate,
        'assignTo': assignTo,
        'status': status,
        'note': note
      };
}
