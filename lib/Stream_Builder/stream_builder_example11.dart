import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamBuilderExample1 extends StatefulWidget {
  const StreamBuilderExample1({Key? key}) : super(key: key);

  @override
  State<StreamBuilderExample1> createState() => _StreamBuilderExample1State();
}

class _StreamBuilderExample1State extends State<StreamBuilderExample1> {
  //StreamController scontroller = StreamController();
  int data = 0;

  final colorStream = StreamController<Color>();

  // generate new Color randomly
  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      255,
    );
  }

// add Color to `colorStream`
//   addData() {
//     colorStream.sink.add(generateColor());
//   }

  // @override
  // void initState() {
  //   addData();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   colorStream
  //       .close(); // To prevent memory leak, Make Sure you close the Stream.
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: colorStream.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  // if (snapshot.connectionState == ConnectionState.done) {}

                  return Container(
                    height: 220,
                    width: 220,
                    color: snapshot.data,
                  );
                }),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    colorStream.sink.add(generateColor());
                    super.initState();
                    colorStream.close();
                  });
                },
                child: Text("Click"))
          ],
        ),
      ),
    );
  }
}
