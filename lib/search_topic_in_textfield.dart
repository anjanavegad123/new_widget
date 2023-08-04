import 'package:flutter/material.dart';

class SearchInTextFieldDemo extends StatefulWidget {
  const SearchInTextFieldDemo({Key? key}) : super(key: key);

  @override
  State<SearchInTextFieldDemo> createState() => _SearchInTextFieldDemoState();
}

class _SearchInTextFieldDemoState extends State<SearchInTextFieldDemo> {
  TextEditingController namecontroller = TextEditingController();
  List name = [
    "Anjana",
    "Shreya",
    "Chirag",
    "Ankita",
    "Vaisu",
    "Daiwik",
    "Hitika",
    "Chintu",
    "Hina",
  ];
  List addName = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              //textfield ma je name type karsu e value ma store thase...
              onChanged: (value) {
                setState(() {
                  //addname ne clear karse
                  addName.clear();
                });
                name.forEach((element) {
                  //name list che e forEach loop ma  jase
                  if (element.contains(value)) {
                    //je name type kriyu hse textfield ma e value ane element ma bne check karse
                    //jo hase to addname ma add thase
                    addName.add(element);
                  }
                });
              },
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            namecontroller.text ==
                    "" //jo textfield ma kasu enter nai kriyu hase to akhu list print karse..
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return Text("${name[index]}");
                    },
                  ) //pchi je enter kriyu hse e rite search krine batavse...
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: addName.length,
                    itemBuilder: (context, index) {
                      return Text("${addName[index]}");
                    },
                  )
          ],
        ),
      ),
    );
  }
}
