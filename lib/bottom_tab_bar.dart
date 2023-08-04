import 'package:flutter/material.dart';
import 'package:new_widget/constrained_Box.dart';
import 'package:new_widget/data_table.dart';
import 'package:new_widget/sliver_app_bar.dart';

import 'listwheel_scrollview.dart';

class BottomTabBarDemo extends StatefulWidget {
  const BottomTabBarDemo({Key? key}) : super(key: key);

  @override
  State<BottomTabBarDemo> createState() => _BottomTabBarDemoState();
}

class _BottomTabBarDemoState extends State<BottomTabBarDemo>
    with TickerProviderStateMixin {
  TabController? tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  void dispose() {
    tabcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
          child: Container(
        color: Colors.yellow.shade50,
        height: 40,
        //width: 300,
        child: TabBar(
          indicatorWeight: 3,
          controller: tabcontroller,
          unselectedLabelColor: Colors.yellow,
          labelColor: Colors.lightGreen,
          indicatorColor: Colors.yellow,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text("Chat"),
            Text("Status"),
            Text("Calls"),
          ],
        ),
      )),
      body: TabBarView(controller: tabcontroller, children: [
        ListWheelScrollViewDemo(),
        DataTableDemo(),
        SliverAppBarDemo(),
      ]),
    );
  }
}
