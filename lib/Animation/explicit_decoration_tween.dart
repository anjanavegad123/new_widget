import 'package:flutter/material.dart';

class ExplicitDecorationTween extends StatefulWidget {
  const ExplicitDecorationTween({Key? key}) : super(key: key);

  @override
  State<ExplicitDecorationTween> createState() =>
      _ExplicitDecorationTweenState();
}

class _ExplicitDecorationTweenState extends State<ExplicitDecorationTween> {
  Decoration boxdecoration = BoxDecoration();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          onEnd: () {
            setState(() {
              boxdecoration = boxdecoration ==
                      BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.blueGrey]))
                  ? BoxDecoration(color: Colors.yellow, boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent,
                        offset: Offset(10, 10),
                        blurRadius: 5,
                      )
                    ])
                  : BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.yellow, Colors.blueGrey]));
            });
          },
          duration: Duration(seconds: 1),
          tween: DecorationTween(
              begin: BoxDecoration(color: Colors.green), end: boxdecoration),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Container(
              height: 200,
              width: 200,
              decoration: boxdecoration,
            );
          },
        ),
      ),
    );
  }
}
