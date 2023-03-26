import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/model/Task.dart';

class TaskRepo {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection('task');

  Future<void> deleteTask(String id) async {
    await _taskCollection.doc(id).delete();
  }

  Stream<List<Task>> getTaskList() {
    return _taskCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Task.fromSnapshot(doc)).toList());
  }

  Future<Task?> getTask(String id) async {
    DocumentSnapshot snapshot = await _taskCollection.doc(id).get();
    if (!snapshot.exists) return null;
    return Task.fromSnapshot(snapshot);
  }

  Future<void> addTask(Task task) async {
    try {
      CollectionReference taskRef =
          FirebaseFirestore.instance.collection("task");

      DocumentReference newTaskRef = taskRef.doc();

      await newTaskRef.set({
        'id': newTaskRef.id,
        'taskName': task.taskName,
        'description': task.description,
        'priority': task.priority,
        'dueDate': task.dueDate,
        'assignTo': task.assignTo,
        'status': task.status,
        'note': task.note
      });

      print('Task added with ID: ${newTaskRef.id}');
    } catch (e) {
      print('Error adding task: $e');
    }
  }
}
