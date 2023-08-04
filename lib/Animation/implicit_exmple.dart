import 'package:flutter/material.dart';

class ImplicitExample extends StatefulWidget {
  const ImplicitExample({Key? key}) : super(key: key);

  @override
  State<ImplicitExample> createState() => _ImplicitExampleState();
}

class _ImplicitExampleState extends State<ImplicitExample>
    with TickerProviderStateMixin {
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
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          AnimatedBuilder(
            animation: controller!,
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: controller!.value * 150,
                      width: controller!.value * 150,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          height: controller!.value * 80,
                          width: controller!.value * 110,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Animation",
                              style: TextStyle(
                                  fontSize: controller!.value * 20,
                                  foreground: Paint()
                                    ..shader = LinearGradient(colors: [
                                      Colors.white,
                                      Colors.greenAccent.shade200,
                                      Colors.lime
                                    ]).createShader(
                                        Rect.fromLTWH(100, 0, 200, 0))),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: controller!.value * 150,
                          width: controller!.value * 150,
                          color: Colors.yellow,
                          child: Center(
                            child: Text(
                              "Implicit",
                              style: TextStyle(
                                  fontSize: controller!.value * 40,
                                  foreground: Paint()
                                    ..shader = LinearGradient(colors: [
                                      Colors.blue,
                                      Colors.pink.shade200,
                                      Colors.red
                                    ]).createShader(
                                        Rect.fromLTWH(100, 0, 200, 0))),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: controller!.value * 80,
                          width: controller!.value * 110,
                          decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Animation",
                              style: TextStyle(
                                  fontSize: controller!.value * 20,
                                  foreground: Paint()
                                    ..shader = LinearGradient(colors: [
                                      Colors.white,
                                      Colors.grey.shade200,
                                      Colors.green
                                    ]).createShader(
                                        Rect.fromLTWH(100, 0, 200, 0))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: controller!.value * 200,
                      width: controller!.value * 200,
                      decoration: BoxDecoration(
                          color: Colors.teal.shade400, shape: BoxShape.circle),
                    ),
                  ],
                ),
              );
            },
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              if (controller!.isAnimating) {
                controller!.stop();
              } else if (controller!.isCompleted) {
                controller!.reverse();
              } else {
                controller!.forward();
              }
            },
            child: Text("Click"),
          ),
        ],
      ),
    );
  }
}
