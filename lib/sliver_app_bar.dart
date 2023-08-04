import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatefulWidget {
  const SliverAppBarDemo({Key? key}) : super(key: key);

  @override
  State<SliverAppBarDemo> createState() => _SliverAppBarDemoState();
}

class _SliverAppBarDemoState extends State<SliverAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300, centerTitle: false,
              toolbarHeight: 50, pinned: true,
              backgroundColor: Colors.teal,
              title: Text("Whatsapp"),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Document"),
                background: Image.network(
                  "https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bmF0dXJhbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                  fit: BoxFit.fill,
                ),
              ),
              //centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Column(children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.red,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.green.shade200,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.pink.shade200,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.yellow.shade200,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
