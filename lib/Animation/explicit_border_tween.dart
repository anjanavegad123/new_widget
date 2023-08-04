import 'package:flutter/material.dart';

class ExplicitBorderTweenDemo extends StatefulWidget {
  const ExplicitBorderTweenDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitBorderTweenDemo> createState() =>
      _ExplicitBorderTweenDemoState();
}

class _ExplicitBorderTweenDemoState extends State<ExplicitBorderTweenDemo> {
  double height = 200;
  double width = 200;
  Color color = Colors.orange;
  Border border = Border.all(color: Colors.yellow, width: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          onEnd: () {
            setState(() {
              border = border == Border.all(color: Colors.green, width: 10)
                  ? Border.all(color: Colors.red, width: 3)
                  : Border.all(color: Colors.green, width: 10);

              height = height == 200 ? 100 : 200;
              width = width == 200 ? 100 : 200;
            });
          },
          duration: Duration(seconds: 1),
          tween: BorderTween(begin: Border.all(color: Colors.red), end: border),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: color, border: border),
            );
          },
        ),
      ),
    );
  }
}
