import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({Key? key}) : super(key: key);

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime initial = DateTime.now();
  DateTime current = DateTime.now();

  DateFormat dateformat = DateFormat("dd/MM/yyyy");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () async {
              current = (await showDatePicker(
                fieldLabelText: "Select Date",
                fieldHintText: "Date",
                helpText: "Select Date",
                errorInvalidText: "Invalid",
                cancelText: "Exit",
                confirmText: "Done",
                context: context,
                initialDate: initial,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              ))!;
              setState(() {});
            },
          );
        },
        child: Icon(Icons.date_range),
      ),
      body: Center(child: Text("${dateformat.format(current)}")),
    );
  }
}
