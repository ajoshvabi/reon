import 'package:flutter/material.dart';
import 'package:ui/model.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Model> list = [
    Model(
        name: "name",
        img:
            "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        tab: "tab",
        type: "type"),
    Model(
        name: "name",
        img:
            "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        tab: "tab",
        type: "type"),
    Model(
        name: "name1",
        img:
            "https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        tab: "tab",
        type: "type"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
          ),
          title: const Text(
            "Interest",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          bottom: const TabBar(
            dividerColor: Color.fromARGB(255, 210, 210, 210),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "I'm Intrested",
              ),
              Tab(
                text: "Received",
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     childAspectRatio: 9 / 11,
              //     children: const [
              // ListView.builder(
              //   itemCount: list.length,
              //   itemBuilder: (context, index) {
              //     Model data = list[index];
              //     return post(data);
              //   },
              // )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: GridView.count(
              //     shrinkWrap: true,
              //     crossAxisCount: 2,
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     childAspectRatio: 9 / 11,

              //  List.generate(list.length, (vsl) {
              //   return post(list[vsl]);
              // })

              //     children: [
              //       ListView.builder(
              //         itemCount: list.length,
              //         itemBuilder: (context, index) {
              //           Model data = list[index];
              //           return post(data);
              //         },
              //       ),
              //     ],
              //   ),

              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 11),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Model data = list[index];
                  return post(data);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 9 / 11),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Model data = list[index];
                  return post(data);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Container post(Model data) {
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:
            DecorationImage(image: NetworkImage(data.img), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 15.0,
                    backgroundColor: const Color.fromARGB(64, 0, 0, 0),
                    child: IconButton(
                        onPressed: () {
                          bottomsheet(data.name, data.tab);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 15,
                        ))),
              )
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  data.type,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> bottomsheet(name, tab) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          height: 300,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black12),
                  height: 10,
                  width: 50,
                ),
              ),
              const Spacer(),
              Text(
                "Are you sure you want to remove\n$name from your $tab",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.black)),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "No",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      },
    );
  }
}
