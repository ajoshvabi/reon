import 'package:flutter/material.dart';
import 'package:task3/controller/usercontroller.dart';
import 'package:task3/models/usermodel.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  Usercontroller controller = Usercontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0),
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: age,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0),
                labelText: "Age",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Usermodel user = Usermodel(name: name.text, age: age.text);
                  controller.addUser(user);
                },
                child: const Text("Add User"))
          ],
        ),
      ),
    );
  }
}
