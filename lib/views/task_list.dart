import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_list_controller.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);

  final TaskListController _con = Get.put(TaskListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => ListView.builder(
            itemCount: _con.items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(_con.items[index]),
              onTap: () => _con.removeItem(index),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _con.addItem(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
