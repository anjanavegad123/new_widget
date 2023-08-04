import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({Key? key}) : super(key: key);

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: List.generate(
            11,
            (index) => Dismissible(
              key: UniqueKey(),
              crossAxisEndOffset: -5,
              //jo crossAxisEndOffset minus ma value jai to upper ni baju thi delete thase...jo plus hoy to niche thi delete thase....
              background: Icon(Icons.delete),
              //delete kriye tyre scroll kriye text tyr pchi delete icon dekhay
              secondaryBackground: Icon(Icons.share),
              //rightToleft delete karsu to share icon avse ne pchi leftToright scroll karsu to delte icon avse...
              child: Container(
                height: 30,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Index ${index}",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
