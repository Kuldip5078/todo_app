import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/views/task_details_screen.dart';

class TaskListController extends GetxController {
  RxList<String> items = <String>[].obs;
  RxInt count = 0.obs;

  void increment() => count++;

  addItem() {
    items.add("Item: ${items.length + 1}");
  }

  removeItem(index) {
    items.removeAt(index);
    // Get.toNamed('/task_details', arguments: "Hi");
    // Get.to(TaskDetails(), arguments: "Hi");
    // Get.snackbar("Hi", "My index is $index");
  }
}
