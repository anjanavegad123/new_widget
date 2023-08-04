import 'package:flutter/material.dart';

class ExplicitCurveTweenDemo extends StatefulWidget {
  const ExplicitCurveTweenDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitCurveTweenDemo> createState() => _ExplicitCurveTweenDemoState();
}

class _ExplicitCurveTweenDemoState extends State<ExplicitCurveTweenDemo> {
  Alignment alignment = Alignment.bottomRight;
  Curve curve = Curves.bounceInOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TweenAnimationBuilder(
      onEnd: () {
        setState(() {
          curve =
              curve == Curves.easeInCubic ? Curves.linear : Curves.easeInCubic;
          alignment = alignment == Alignment.bottomRight
              ? Alignment.topCenter
              : Alignment.bottomRight;
        });
      },
      duration: Duration(seconds: 2),
      tween: AlignmentTween(begin: Alignment.topLeft, end: alignment),
      builder: (BuildContext context, Alignment value, Widget? child) {
        return AnimatedContainer(
          alignment: alignment,
          curve: curve,
          duration: Duration(seconds: 2),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://m.media-amazon.com/images/I/91iv1O9URdL._SL1500_.jpg"),
              ),
            ),
          ),
        );
      },
    ));
  }
}
