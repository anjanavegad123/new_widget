import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationDemo extends StatefulWidget {
  const ExplicitAnimationDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimationDemo> createState() => _ExplicitAnimationDemoState();
}

class _ExplicitAnimationDemoState extends State<ExplicitAnimationDemo> {
  Color color = Colors.yellow;
  double height = 200;
  double width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          onEnd: () {
            setState(() {
              color = color == Colors.red
                  ? Colors.green
                  : color == Colors.green
                      ? Colors.purple
                      : Colors.red;
              height = height == 200 ? 100 : 200;
              width = width == 200 ? 100 : 200;
            });
          },
          tween: ColorTween(begin: Colors.red, end: color),
          duration: Duration(seconds: 5),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Container(
              height: height,
              width: width,
              color: color,
            );
          },
        ),
      ),
    );
  }
}
