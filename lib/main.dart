import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/views/my_get_storage.dart';
import 'package:todo_app/views/task_list.dart';
import 'views/my_shared_pref.dart';
import 'views/task_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
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
      initialRoute: '/gs',
      getPages: [
        GetPage(name: '/sp', page: () => const MySharedPref()),
        GetPage(name: '/gs', page: () => const MyGetStorage()),
        GetPage(name: '/task_list', page: () => TaskList()),
        GetPage(name: '/task_details', page: () => TaskDetails()),
      ],
    );
  }
}
