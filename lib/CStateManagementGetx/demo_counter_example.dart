import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ControllersGetx/counter_controller.dart';

class DemoCounter extends StatefulWidget {
  const DemoCounter({Key? key}) : super(key: key);

  @override
  State<DemoCounter> createState() => _DemoCounterState();
}

class _DemoCounterState extends State<DemoCounter> {
  int counter = 0;
  CounterController counterController = Get.put(CounterController());

  Future<int> getData() async {
    await Future.delayed(Duration(seconds: 2));
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text("${snapshot.data}");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          GetBuilder<CounterController>(
            builder: (controller) => Text('${counterController.counter}'),
          ),
          // Text('${counterController.counter}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.showSnackbar(GetSnackBar(
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 2),
                title: "Hello",
                message: "GoodMorning",
                forwardAnimationCurve: Curves.bounceInOut,
                animationDuration: Duration(seconds: 10),
              ));
              //counterController.increment();
              //setState(() {});
            },
            child: Text("Add"),
          )
        ],
      )),
    );
  }
}
