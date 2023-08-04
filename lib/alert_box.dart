import 'package:flutter/material.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({Key? key}) : super(key: key);

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      //automatic value or widget prmane size lai liye
                      title: Column(
                        children: [
                          Text("Hello World"),
                          Text("Hello World"),
                          Text("Hello World"),
                          Text("Hello World"),
                          Text("Hello World"),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("Click!!"),
            )
          ],
        ),
      ),
    );
  }
}
