import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../LocalStorage/home_page.dart';
import 'home_page.dart';

class LoginPage1 extends StatefulWidget {
  const LoginPage1({Key? key}) : super(key: key);

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login page"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                // await box.read(
                //   "uname",
                // );
                var uname = await box.read('uname');
                print('username: $uname');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage1(),
                    ));
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
