import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_widget/LocalStorage/login_page.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            "Register Page",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 50),
          TextField(
            controller: idcontroller,
            decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "User Id",
              constraints: BoxConstraints.expand(
                height: 55.0,
                width: 270.0,
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: "User Name",
              constraints: BoxConstraints.expand(
                height: 55.0,
                width: 270.0,
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () async {
                await box.write("uid", idcontroller.text);
                await box.write("uname", namecontroller.text);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));

                // if (box.read('uid') == idcontroller.text) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => LoginPage(),
                //       ));
                // }
                // else {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => HomePage(),
                //       ));
                // }
              },
              child: Text("Register"))
        ],
      ),
    );
  }
}
