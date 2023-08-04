import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'display_data.dart';

class DemoDataBase extends StatefulWidget {
  const DemoDataBase({
    Key? key,
  }) : super(key: key);

  @override
  State<DemoDataBase> createState() => _DemoDataBaseState();
}

class _DemoDataBaseState extends State<DemoDataBase> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController valuecontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();

  Database? database;

  @override
  initState() {
    createDB();
    super.initState();
  }

  Future<void> createDB() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, 'demo.db');

    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER,num REAL)');
    });
  }

  Future<void> insertData(BuildContext context) async {
    await database!.insert("Test", {
      "id": idcontroller.text,
      "name": namecontroller.text,
      "value": valuecontroller.text,
      "num": numcontroller.text,
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("ADDED")));
  }

  List<Map<String, dynamic>>? data;

  Future<void> getData() async {
    data = await database!.query("Test");

    print("DATA :${data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // await getData();
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return DisplayData(
            data: data!,
          );
        }));
      }),
      body: Center(
        child: Column(children: [
          SizedBox(height: 50),
          TextField(
            onTap: () {},
            controller: idcontroller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              labelText: "Enter ID",
              constraints: BoxConstraints.expand(height: 55, width: 320),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            onTap: () {},
            controller: namecontroller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              labelText: "Enter Name",
              constraints: BoxConstraints.expand(height: 55, width: 320),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            onTap: () {},
            controller: valuecontroller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              labelText: "Enter Value",
              constraints: BoxConstraints.expand(height: 55, width: 320),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            onTap: () {},
            controller: numcontroller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              labelText: "Enter Number",
              constraints: BoxConstraints.expand(height: 55, width: 320),
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => DisplayData(),
                    //     ));

                    insertData(context);
                    getData();
                  },
                  child: Center(
                      child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ))),
            ],
          ),
        ]),
      ),
    );
  }
}
