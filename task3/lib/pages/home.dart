import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task3/controller/usercontroller.dart';
import 'package:task3/models/usermodel.dart';
import 'package:task3/pages/add.dart';
import 'package:task3/pages/edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Usercontroller controller = Usercontroller();
  List<Usermodel> users = [];
  @override
  void initState() {
    // Future<List<Usermodel>> data = controller.getUser();
    // users = data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Add()));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            StreamBuilder(
              stream: controller.getUserStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  List<Usermodel> users = snapshot.data!.docs
                      .map((doc) => Usermodel.fromSnapshot(doc))
                      .toList();
                  // log(doc.id);
                  return Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        String docId = doc.id;
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(user.name),
                                  Text(user.age),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  controller.delete(docId);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit(user: user,docId:docId)));
                                },
                                icon: const Icon(Icons.edit),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
