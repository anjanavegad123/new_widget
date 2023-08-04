import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DemoStorage extends StatefulWidget {
  const DemoStorage({Key? key}) : super(key: key);

  @override
  State<DemoStorage> createState() => _DemoStorageState();
}

class _DemoStorageState extends State<DemoStorage> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await box.write("uid", "1305");
                box.write("uname", "anjana");
              },
              child: Text("Add"),
            ),
            ElevatedButton(
              onPressed: () async {
                var uid = await box.read('uid');
                var uname = await box.read('uname');

                print("UID :$uid");
                print("UNAME :$uname");
              },
              child: Text("Get"),
            ),
            ElevatedButton(
              onPressed: () async {
                box.remove('uid');
              },
              child: Text("Remove"),
            ),
            ElevatedButton(
              onPressed: () {
                box.erase();
              },
              child: Text("Remove all Data"),
            ),
          ],
        ),
      ),
    );
  }
}
