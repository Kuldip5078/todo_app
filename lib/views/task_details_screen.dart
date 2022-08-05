import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_list_controller.dart';

import '../controllers/task_details_controller.dart';

class TaskDetails extends StatelessWidget {
  TaskDetails({Key? key}) : super(key: key);

  final TaskDetailsController _con = Get.put(TaskDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(Get.arguments.toString()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _con.addItem(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
