import 'package:get/get.dart';

class TaskDetailsController extends GetxController {
  RxList<String> items = <String>[].obs;
  RxInt count = 0.obs;

  void increment() => count++;

  addItem() {
    items.add("Item: ${items.length + 1}");
  }

  removeItem(index) {
    // items.removeAt(index);
    Get.toNamed('/task_details', arguments: "Hi");
  }
}
