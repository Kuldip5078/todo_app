import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyGetStorage extends StatefulWidget {
  const MyGetStorage({Key? key}) : super(key: key);

  @override
  State<MyGetStorage> createState() => _MyGetStorageState();
}

class _MyGetStorageState extends State<MyGetStorage> {
  String? data = "NA";
  String? email = "NA";
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Get Storage")),
      body: Column(
        children: [
          Text(data!, style: const TextStyle(fontSize: 30)),
          Text(email!, style: const TextStyle(fontSize: 30)),
          TextButton(
              onPressed: () {
                writeData();
              },
              child: const Text("Write")),
          TextButton(
              onPressed: () {
                deleteData();
              },
              child: const Text("Delete key")),
        ],
      ),
    );
  }

  void getData() {
    var storage = GetStorage();

    if (storage.hasData("name")) {
      setState(() {
        data = storage.read('name');
      });
    }
    if (storage.hasData("email")) {
      setState(() {
        email = storage.read('email');
      });
    }
  }

  void writeData() {
    var storage = GetStorage();
    storage.write("name", "SkillQode");
    storage.write("email", "skill@gmail.com");
    getData();
  }

  void deleteData() {
    var storage = GetStorage();
    storage.remove("name");
    setState(() {
      data = "NA";
    });
    getData();
  }
}
