import 'package:flutter/material.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  const AnimatedOpacityDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityDemo> createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  double opacity = 0.8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          opacity = opacity == 0.8 ? opacity = 0.2 : opacity = 0.8;
          setState(() {});
        },
      ),
      body: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.pink,
            ),
          )),
    );
  }
}
