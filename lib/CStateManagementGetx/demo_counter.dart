import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ControllersGetx/counter_controller.dart';

class CounterDemo extends StatefulWidget {
  const CounterDemo({Key? key}) : super(key: key);

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
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
          //Text('${counter}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Get.defaultDialog(
              //     title: "Hello",
              //     backgroundColor: Colors.teal.shade300,
              //     middleText: "Good nightt",
              //     middleTextStyle: TextStyle(color: Colors.white),
              //     radius: 50,
              //     content: Row(
              //       children: [
              //         CircularProgressIndicator(),
              //         SizedBox(width: 60),
              //         Text("Data is onprocess")
              //       ],
              //     ));

              // Get.showSnackbar(GetSnackBar(
              //   backgroundColor: Colors.teal.shade500,
              //   snackPosition: SnackPosition.BOTTOM,
              //   duration: Duration(seconds: 2),
              //   title: "Hello",
              //   message: "GoodMorning",
              //   forwardAnimationCurve: Curves.bounceInOut,
              //   animationDuration: Duration(seconds: 2),
              //   overlayBlur: 4,
              //   //overlayColor: Colors.red,
              // ));
              Get.bottomSheet(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.white, width: 2)),
                Container(
                  child: Wrap(children: [
                    ListTile(
                      leading: Icon(Icons.wb_sunny_outlined),
                      title: Text("Light Theme"),
                      onTap: () {
                        Get.changeTheme(
                          ThemeData.light(),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text("Dark Theme"),
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                    ),
                  ]),
                ),
              );
            },
            child: Text("Display"),
          ),
        ],
      )),
    );
  }
}
