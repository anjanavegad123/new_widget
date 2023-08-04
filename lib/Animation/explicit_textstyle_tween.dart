import 'package:flutter/material.dart';

class ExplicitTextStyleTweenDemo extends StatefulWidget {
  const ExplicitTextStyleTweenDemo({Key? key}) : super(key: key);

  @override
  State<ExplicitTextStyleTweenDemo> createState() =>
      _ExplicitTextStyleTweenDemoState();
}

class _ExplicitTextStyleTweenDemoState
    extends State<ExplicitTextStyleTweenDemo> {
  TextStyle textstyle = TextStyle();
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 1),
          onEnd: () {
            setState(() {
              textstyle = textstyle ==
                      TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          shadows: [
                            BoxShadow(
                                color: Colors.teal.shade100,
                                offset: Offset(0, 10),
                                blurRadius: 5)
                          ])
                  ? TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(colors: [
                          Colors.greenAccent,
                          Colors.yellow,
                          Colors.red
                        ]).createShader(Rect.fromLTWH(100, 0, 200, 0)))
                  : TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      shadows: [
                          BoxShadow(
                              color: Colors.teal.shade100,
                              offset: Offset(0, 10),
                              blurRadius: 5)
                        ]);

              text = text == "Animation"
                  ? "Explicit"
                  : text =
                      text == "Explicit11" ? "ExplicitAnimation" : "Animation";
            });
          },
          tween: TextStyleTween(begin: TextStyle(fontSize: 30), end: textstyle),
          builder: (BuildContext context, Object? value, Widget? child) {
            return Text(
              text,
              style: textstyle,
            );
          },
        ),
      ),
    );
  }
}
