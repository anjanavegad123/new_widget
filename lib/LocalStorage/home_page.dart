import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_widget/LocalStorage/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Home Scareen",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                box.erase();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Text("LogOut"))
        ],
      ),
    );
  }
}
