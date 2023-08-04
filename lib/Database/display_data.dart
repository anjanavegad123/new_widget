import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  TextEditingController idcontroller1 = TextEditingController();
  TextEditingController namecontroller1 = TextEditingController();
  TextEditingController valuecontroller1 = TextEditingController();
  TextEditingController numcontroller1 = TextEditingController();

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
          'CREATE TABLE Test (id INTEGER, name STRING, value INTEGER,num REAL)');
    });
  }

  Future<void> getData() async {
    List<Map<String, dynamic>> data = await database!.query("Test");

    print("DATA :${data}");
  }

  Future<void> updateData(int id, String name, value, num) async {
    await database!.update(
      "Test",
      {
        "name": name,
        "value": value,
        "num": num,
      },
      where: "id=?",
      whereArgs: [id],
    );
  }

  Future<void> deleteData(int id) async {
    await database!.delete(
      "Test",
      where: "id=?",
      whereArgs: [id],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    namecontroller1.text = widget.data[index]["name"];
                    valuecontroller1.text =
                        widget.data[index]["value"].toString();
                    numcontroller1.text = widget.data[index]["num"].toString();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 550,
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 40),
                                TextField(
                                  controller: namecontroller1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    labelText: "Name",
                                    constraints: BoxConstraints.expand(
                                        height: 55, width: 220),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  controller: valuecontroller1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    labelText: "Value",
                                    constraints: BoxConstraints.expand(
                                        height: 55, width: 220),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  controller: numcontroller1,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    labelText: "Number",
                                    constraints: BoxConstraints.expand(
                                        height: 55, width: 220),
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          updateData(
                                            widget.data[index]["id"],
                                            namecontroller1.text,
                                            valuecontroller1.text,
                                            numcontroller1.text,
                                          );
                                          getData();
                                        },
                                        child: Center(
                                            child: Text(
                                          "Update",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                    SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Center(
                                            child: Text(
                                          "Cancel",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "ID: ${widget.data[index]['id']},",
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      Text("Name: ${widget.data[index]['name']},"),
                      Text("Value: ${widget.data[index]['value']},"),
                      Text("Number: ${widget.data[index]['num']},"),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Spacer(),
                InkResponse(
                  onTap: () {
                    deleteData(widget.data[index]['id']);
                  },
                  child: Icon(Icons.delete),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
