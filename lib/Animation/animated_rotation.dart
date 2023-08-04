import 'package:flutter/material.dart';

class AnimatedRotationDemo extends StatefulWidget {
  const AnimatedRotationDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedRotationDemo> createState() => _AnimatedRotationDemoState();
}

class _AnimatedRotationDemoState extends State<AnimatedRotationDemo> {
  double turn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          turn = turn == 0
              ? 1
              : turn == 1
                  ? 2
                  : 0;
          setState(() {});
        },
      ),
      body: AnimatedRotation(
        duration: Duration(seconds: 1),
        turns: turn,
        child: Center(
          child: Text(
            "Animation",
            style: TextStyle(fontSize: 30, color: Colors.pink),
          ),
          // Container(
          //   height: 200,
          //   width: 200,
          //   color: Colors.pink,
          // ),
        ),
      ),
    );
  }
}
