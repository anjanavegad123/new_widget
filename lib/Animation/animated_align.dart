import 'package:flutter/material.dart';

class AnimatedAlignDemo extends StatefulWidget {
  const AnimatedAlignDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignDemo> createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  double height = 200;
  double width = 200;
  Color color = Colors.pink;
  Alignment alignment = Alignment.topCenter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     height = height == 200 ? 100 : 200;
      //     width = width == 200 ? 100 : 200;
      //     color = color == Colors.pink ? Colors.yellow : Colors.pink;
      //     alignment = alignment == Alignment.topCenter
      //         ? Alignment.bottomCenter
      //         : Alignment.topCenter;
      //     setState(() {});
      //   },
      // ),
      // body: AnimatedAlign(
      //   duration: Duration(seconds: 2),
      //   alignment: alignment,
      //   child: Container(
      //     height: height,
      //     width: width,
      //     color: color,
      //     alignment: alignment,
      //   ),
      // ),
      bottomNavigationBar: SafeArea(
        child: Wrap(clipBehavior: Clip.none, spacing: 1, children: [
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.topLeft;
              setState(() {});
            },
            child: Text("TopLeft"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.topCenter;
              setState(() {});
            },
            child: Text("TopCenter"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.topRight;
              setState(() {});
            },
            child: Text("TopRight"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.bottomLeft;
              setState(() {});
            },
            child: Text("BottomLeft"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.bottomCenter;
              setState(() {});
            },
            child: Text("BottomCenter"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.bottomRight;
              setState(() {});
            },
            child: Text("BottomRight"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.centerLeft;
              setState(() {});
            },
            child: Text("CenterLeft"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.center;
              setState(() {});
            },
            child: Text("Center"),
          ),
          ElevatedButton(
            onPressed: () {
              alignment = alignment = Alignment.centerRight;
              setState(() {});
            },
            child: Text("CenterRight"),
          ),
        ]),
      ),
      body: Center(
        child: AnimatedAlign(
          duration: Duration(seconds: 1),
          alignment: alignment,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.lime,
          ),
        ),
      ),
    );
  }
}
