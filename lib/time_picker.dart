import 'package:flutter/material.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({Key? key}) : super(key: key);

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  String? time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: 24, minute: 60))
              .then(
            (value) {
              time = value!.format(context);
              setState(() {});
            },
          );
        },
        child: Icon(Icons.timer_outlined),
      ),
      body: Center(child: Text("${time}")),
    );
  }
}
