import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_list_controller.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);
  final TaskListController _con = Get.put(TaskListController());
  final Stream<QuerySnapshot> _tasks =
      FirebaseFirestore.instance.collection('tasks').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: _tasks,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot doc) {
              Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['taskTitle']),
                subtitle: Text(data['taskDesc']),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _con.addItem(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
