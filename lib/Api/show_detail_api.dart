import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class Show_Detail extends StatefulWidget {
  const Show_Detail({Key? key, this.displaydata}) : super(key: key);
  final displaydata;

  @override
  State<Show_Detail> createState() => _Show_DetailState();
}

class _Show_DetailState extends State<Show_Detail> {
  var data;

  Future getdata() async {
    https.Response response = await https.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/${widget.displaydata}"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
    } else {
      print("STATUS CODE ${response.statusCode}");
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "USER_ID : ${snapshot.data["userId"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("ID : ${snapshot.data["id"]}"),
                  Text("TITLE : ${snapshot.data["title"]}"),
                  Text(
                    "BODY : ${snapshot.data["body"]}",
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
