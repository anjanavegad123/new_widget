import 'package:flutter/material.dart';

class FutureDemo extends StatefulWidget {
  const FutureDemo({Key? key}) : super(key: key);

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  List<Map<String, dynamic>> person = [
    {
      "Name": "shreya",
      "LastName": "Chovatiya",
      "Number": "9875468245",
    },
    {
      "Name": "Anjana",
      "LastName": "Chauhan",
      "Number": "986551215",
    },
  ];

  Future getData() async {
    print("hello");
    await Future.delayed(Duration(seconds: 2));
    print("Good Afternoon!!");
    return person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: person.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "FirstName : ${person[index]["Name"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("LastName : ${person[index]["LastName"]}"),
                      Text("Number : ${person[index]["Number"]}"),
                      SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something want worong!!"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
