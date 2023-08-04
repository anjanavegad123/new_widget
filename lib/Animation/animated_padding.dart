import 'package:flutter/material.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  const AnimatedPaddingDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingDemo> createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  double padding = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          padding = padding == 0 ? 20 : 0;
          setState(() {});
        },
      ),
      body: Center(
        child: AnimatedPadding(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Container(
            height: 200,
            width: 410,
            color: Colors.lime,
          ),
        ),
      ),
    );
  }
}
