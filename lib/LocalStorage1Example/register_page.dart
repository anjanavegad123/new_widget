import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_widget/LocalStorage/home_page.dart';
import 'package:new_widget/LocalStorage1Example/home_page.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({Key? key}) : super(key: key);

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("register page"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                await box.write("uname", "anjana chauhan");

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage1(),
                    ));
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
