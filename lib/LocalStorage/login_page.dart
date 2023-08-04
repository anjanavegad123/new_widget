import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_widget/LocalStorage/home_page.dart';
import 'package:new_widget/LocalStorage/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Page",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 50),
            TextField(
              controller: idController,
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
              controller: nameController,
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
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () async {
                  // box.read(
                  //   'uid',
                  // );
                  //
                  // box.read(
                  //   "uname",
                  // );
                  var data = await box.read('uid');

                  if (data == idController.text) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  } else {
                    print("Invalid Creadital");
                  }
                  // var uid = await box.read('uid');
                  // var uname = await box.read('uname');
                  // print('Uid: $uid ');
                  // print('UName: $uname ');
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
