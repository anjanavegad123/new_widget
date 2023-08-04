import 'package:flutter/material.dart';

class ExplicitBorderRadiusTweenDemo extends StatefulWidget {
  const ExplicitBorderRadiusTweenDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitBorderRadiusTweenDemo> createState() =>
      _ExplicitBorderRadiusTweenDemoState();
}

class _ExplicitBorderRadiusTweenDemoState
    extends State<ExplicitBorderRadiusTweenDemo> {
  double borderradius = 30;
  double height = 200;
  double width = 200;
  Color color = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          onEnd: () {
            setState(() {
              borderradius = borderradius == 30 ? 5 : 30;
              height = height == 200 ? 100 : 200;
              width = width == 200 ? 100 : 200;
            });
          },
          tween: BorderRadiusTween(
              begin: BorderRadius.circular(10),
              end: BorderRadius.circular(borderradius)),
          builder: (BuildContext context, BorderRadius? value, Widget? child) {
            return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderradius)),
            );
          },
        ),
      ),
    );
  }
}
