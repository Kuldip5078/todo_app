import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref extends StatefulWidget {
  const MySharedPref({Key? key}) : super(key: key);

  @override
  State<MySharedPref> createState() => _MySharedPrefState();
}

class _MySharedPrefState extends State<MySharedPref> {
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
      appBar: AppBar(),
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

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString("name"));
    // print(prefs.getString("email"));

    if (prefs.containsKey("name")) {
      setState(() {
        data = prefs.getString("name");
      });
    }
    if (prefs.containsKey("email")) {
      setState(() {
        email = prefs.getString("email");
      });
    }
  }

  void writeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "SkillQode");
    prefs.setString("email", "skill@gmail.com");
    getData();
  }

  void deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString("name", "");
    // prefs.clear();
    prefs.remove("name");
  }
}
