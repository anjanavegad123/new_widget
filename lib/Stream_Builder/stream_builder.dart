import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderDemo extends StatefulWidget {
  const StreamBuilderDemo({Key? key}) : super(key: key);

  @override
  State<StreamBuilderDemo> createState() => _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  StreamController counter = StreamController();
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data++;
          counter.sink.add(data);
          setState(() {});
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: counter.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text("${snapshot.data}"),
            );
          } else {
            return Center(
              child: Text("${data}"),
            );
          }
        },
      ),
    );
  }
}
