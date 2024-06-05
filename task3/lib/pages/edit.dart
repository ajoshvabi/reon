import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task3/controller/usercontroller.dart';
import 'package:task3/models/usermodel.dart';

class Edit extends StatefulWidget {
  final Usermodel user;
  final String docId;
  const Edit({super.key, required this.user, required this.docId});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController name;
  late TextEditingController age;
  Usercontroller controller = Usercontroller();

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.user.name);
    age = TextEditingController(text: widget.user.age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Data"),
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
                  Usermodel userdata =
                      Usermodel(name: name.text, age: age.text);
                  // log(user.docid);

                  controller.updateUser(userdata,widget.docId);
                },
                child: const Text("Update User"))
          ],
        ),
      ),
    );
  }
}
