import 'package:flutter/material.dart';

class DateRangePickerDemo extends StatefulWidget {
  const DateRangePickerDemo({Key? key}) : super(key: key);

  @override
  State<DateRangePickerDemo> createState() => _DateRangePickerDemoState();
}

class _DateRangePickerDemoState extends State<DateRangePickerDemo> {
  var date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2100))
              .then((value) {
            date = value!.duration.inDays;
            setState(() {});
          });
        },
        child: Icon(Icons.date_range_outlined),
      ),
      body: Center(
          child: Text(
        "Your Date Range is ${date}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      )),
    );
  }
}
