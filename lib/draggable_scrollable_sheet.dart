import 'package:flutter/material.dart';

class DraggableScrollableSheetDemo extends StatefulWidget {
  const DraggableScrollableSheetDemo({Key? key}) : super(key: key);

  @override
  State<DraggableScrollableSheetDemo> createState() =>
      _DraggableScrollableSheetDemoState();
}

class _DraggableScrollableSheetDemoState
    extends State<DraggableScrollableSheetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.network(
            height: 600,
            "https://images.unsplash.com/photo-1620503292890-c597f62cce8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNwbGFzaHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            minChildSize: 0.2,
            maxChildSize:
                0.9, //upper thi 9 thi start karse ane jo maxChildSize na apiye to byDefalut uppewr thi start karse...
            snap: true,
            snapSizes: [
              0.5,
              0.8
            ], //scroll kriye tyre 0.2 index ne 0.8 index per stop kre
            builder: (context, scrollController) {
              return ListView.builder(
                controller: scrollController,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    width: 300,
                    margin: EdgeInsets.only(top: 10),
                    color: Colors.green.withOpacity(0.3),
                    child: Center(
                      child: Text("Index ${index}"),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ));
  }
}
