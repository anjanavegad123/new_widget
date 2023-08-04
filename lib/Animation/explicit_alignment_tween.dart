import 'package:flutter/material.dart';

class ExplicitAlignmentTweenDemo extends StatefulWidget {
  const ExplicitAlignmentTweenDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitAlignmentTweenDemo> createState() =>
      _ExplicitAlignmentTweenDemoState();
}

class _ExplicitAlignmentTweenDemoState
    extends State<ExplicitAlignmentTweenDemo> {
  Alignment alignment = Alignment.topRight;
  double height = 200;
  double width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          onEnd: () {
            setState(() {
              alignment = alignment == Alignment.topRight
                  ? Alignment.bottomLeft
                  : Alignment.topRight;

              height = height == 200 ? 100 : 200;
              width = width == 200 ? 100 : 200;
            });
          },
          duration: Duration(seconds: 2),
          tween: AlignmentTween(begin: Alignment.bottomCenter, end: alignment),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Align(
              alignment: alignment,
              child: Container(
                height: height,
                width: width,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
