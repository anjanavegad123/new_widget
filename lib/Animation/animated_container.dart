import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double height = 200;
  double width = 200;
  Color color = Colors.lime;
  Border border = Border.all(color: Colors.red);
  double borderradius = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          height = height == 200 ? 100 : 200;
          width = width == 200 ? 100 : 200;
          color = color == Colors.lime ? Colors.yellow : Colors.lime;
          border = border == Border.all(color: Colors.green)
              ? Border.all(color: Colors.red)
              : Border.all(color: Colors.green);
          borderradius = borderradius == 20 ? 0 : 20;
          setState(() {});
        },
      ),
      body: Center(
          child: AnimatedContainer(
        duration: Duration(seconds: 2),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              border: border,
              color: color,
              borderRadius: BorderRadius.circular(borderradius)),
        ),
      )),
    );
  }
}
