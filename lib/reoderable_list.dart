import 'package:flutter/material.dart';

class Reorderable_Listview extends StatefulWidget {
  const Reorderable_Listview({Key? key}) : super(key: key);

  @override
  State<Reorderable_Listview> createState() => _Reorderable_ListviewState();
}

class _Reorderable_ListviewState extends State<Reorderable_Listview> {
  List name = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReorderableListView.builder(
      itemCount: name.length,
      onReorder: (oldindex, newIndex) {
        setState(() {
          if (newIndex > oldindex) {
            newIndex -= 1;
          }
        });
        var olditem = name.removeAt(oldindex);
        //old item remove krine olditem ma store karse...
        name.insert(newIndex, olditem);
        //pchi olditem ni value newIndex ma insert karse..
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          key: UniqueKey(),
          height: 40,
          width: double.infinity,
          child: Center(
            child: Text("Name ${name[index]}"),
          ),
        );
      },
    ));
  }
}
