import 'package:flutter/material.dart';

class Constrained_Box extends StatefulWidget {
  const Constrained_Box({Key? key}) : super(key: key);

  @override
  State<Constrained_Box> createState() => _Constrained_BoxState();
}

class _Constrained_BoxState extends State<Constrained_Box> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 100, minWidth: 100, maxHeight: 400, maxWidth: 400),
              child: Container(
                //ama 200 size laiye to pan height 100 j ave bcz BoxConstraints ma 100 lidhi che etle
                height: 200,
                width: 200,
                color: Colors.teal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
