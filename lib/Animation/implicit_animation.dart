import 'package:flutter/material.dart';

class Implicit extends StatefulWidget {
  const Implicit({Key? key}) : super(key: key);

  @override
  State<Implicit> createState() => _ImplicitState();
}

class _ImplicitState extends State<Implicit> with TickerProviderStateMixin {
  AnimationController? controller;

  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller!.isAnimating) {
            controller!.stop();
          } else if (controller!.isCompleted) {
            controller!.reverse();
          } else {
            controller!.forward();
          }
        },
      ),
      body: AnimatedBuilder(
        animation: controller!,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Container(
              height: controller!.value * 200,
              width: controller!.value * 200,
              color: Colors.teal,
            ),
          );
        },
      ),
    );
  }
}
