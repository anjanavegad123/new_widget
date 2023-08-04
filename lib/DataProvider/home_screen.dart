import 'package:flutter/material.dart';
import 'package:new_widget/DataProvider/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context, listen: true);
    //listean:true ....lkhiye to akhi build method call thay ane false kriye to jya use kriye e build thay...
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CounterProvider>(
            builder: (context, counterProvider, child) {
              return Text("${counterProvider.counter}");
            },
          ),
          ElevatedButton(
              onPressed: () {
                provider.increment();
              },
              child: Text("Add"))
        ],
      )),
    );
  }
}
