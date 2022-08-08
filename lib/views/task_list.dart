import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_list_controller.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);
  final TaskListController _con = Get.put(TaskListController());
  final Stream<QuerySnapshot> _tasks =
      FirebaseFirestore.instance.collection('tasks').snapshots();
  String? task = '';

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

          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
                return ListTile(
                  onLongPress: () => update(
                      context: context,
                      docId: doc.id,
                      oldTask: data['taskTitle']),
                  title: Text(data['taskTitle']),
                  subtitle: Text(data['taskDesc']),
                  trailing: IconButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('tasks')
                            .doc(doc.id)
                            .delete();
                      },
                      icon: const Icon(Icons.delete)),
                );
              }).toList(),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          task = '';
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: TextFormField(
                  onChanged: (v) {
                    task = v;
                  },
                  decoration: const InputDecoration(hintText: 'Enter task')),
              actions: [
                TextButton(
                    onPressed: () async {
                      // Add task logic of firebase
                      await FirebaseFirestore.instance.collection('tasks').add({
                        'taskTitle': task,
                        'taskDesc': 'NA',
                      });
                      Get.back();
                    },
                    child: const Text("Add task"))
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  update({context, docId, oldTask}) {
    task = oldTask;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextFormField(
            initialValue: oldTask,
            onChanged: (v) {
              task = v;
            },
            decoration: const InputDecoration(hintText: 'Enter task')),
        actions: [
          TextButton(
              onPressed: () async {
                // Add task logic of firebase
                await FirebaseFirestore.instance
                    .collection('tasks')
                    .doc(docId)
                    .update({
                  'taskTitle': task,
                  'taskDesc': 'NA',
                });
                Get.back();
              },
              child: const Text("Update task"))
        ],
      ),
    );
  }
}
