import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/views/task_list.dart';

import 'views/task_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/task_list',
      getPages: [
        GetPage(name: '/task_list', page: () => TaskList()),
        GetPage(name: '/task_details', page: () => TaskDetails()),
      ],
    );
  }
}
