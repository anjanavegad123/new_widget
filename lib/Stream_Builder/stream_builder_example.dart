import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({Key? key, this.addition}) : super(key: key);
  final addition;
  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  final formkey = GlobalKey<FormState>();
  StreamController streamController = StreamController();
  TextEditingController txtcontroller = TextEditingController();
  List name = [];
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 70),
              TextFormField(
                controller: txtcontroller,
                decoration: InputDecoration(
                    hintText: "Enter Text",
                    constraints: BoxConstraints.expand(height: 50, width: 300),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey))),
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.teal.shade400,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      name.add(txtcontroller.text);
                      streamController.sink.add(name);
                      txtcontroller.clear();
                      //txtcontroller;
                    });
                  },
                  child: Text(
                    "Add Data",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: name.length,
                  itemBuilder: (context, index) {
                    return Text("${name[index]}");
                  },
                ),
              )

              //  Text("${txtcontroller.text}"),
            ],
          ),
        ),
      ),
    );
  }
}
