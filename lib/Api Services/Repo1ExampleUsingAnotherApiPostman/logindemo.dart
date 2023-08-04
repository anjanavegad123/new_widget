import 'package:flutter/material.dart';
import 'package:new_widget/Api%20Services/Repo(Repository%20)/get_products_repo.dart';
import 'package:new_widget/Api%20Services/Repo1ExampleUsingAnotherApiPostman/LoginResponseModel.dart';
import 'package:new_widget/Api%20Services/Repo1ExampleUsingAnotherApiPostman/login_repo.dart';

class LoginDemoPage extends StatefulWidget {
  const LoginDemoPage({Key? key}) : super(key: key);

  @override
  State<LoginDemoPage> createState() => _LoginDemoPageState();
}

class _LoginDemoPageState extends State<LoginDemoPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter email",
                    constraints:
                        BoxConstraints.expand(height: 55.0, width: 300.0),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Enter Password",
                    constraints:
                        BoxConstraints.expand(height: 55.0, width: 300.0),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    PostLoginRepo.postLoginRepo(
                        emailcontroller.text, passwordcontroller.text);
                  },
                  child: Text("Post"),
                ),
              ],
            ),
          )

          // ElevatedButton(
          //   onPressed: () {
          //     PostLoginRepo.postLoginRepo();
          //   },
          //   child: Text("Post"),
          // ),
        ],
      ),
    );
  }
}
