import 'package:flutter/material.dart';

class ListWheelScrollViewDemo extends StatefulWidget {
  const ListWheelScrollViewDemo({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewDemo> createState() =>
      _ListWheelScrollViewDemoState();
}

class _ListWheelScrollViewDemoState extends State<ListWheelScrollViewDemo> {
  List name = [
    "Anjana",
    "Chirag",
    "Hitika",
    "Nilesh",
    "Daiwik",
    "Rohit",
    "Hari"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListWheelScrollView(
      itemExtent: 50,
      diameterRatio: 0.9,
      //name vache space chodse
      magnification: 1,
      perspective: 0.01,
      //arrow jya hoy tya text mota hoy baki nana hoy...ama value 0.01 thi increase na thavi joie...
      overAndUnderCenterOpacity: 0.18,
      //jetli value vadhu apsu etlu ek text proper dekhase ne beja light dekhase
      physics: BouncingScrollPhysics(),
      //text scroll kriye tyre badha text jump thay
      offAxisFraction: -0.5,
      //plus(0.5) value apsu to left side round banine value display thase ne minus(-0.5) ma right side round banine value display thase
      children: List.generate(name.length, (index) => Text("${name[index]}")),
    ));
  }
}
