import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postApiUsingList extends StatefulWidget {
  const postApiUsingList({Key? key}) : super(key: key);

  @override
  State<postApiUsingList> createState() => _postApiUsingListState();
}

class _postApiUsingListState extends State<postApiUsingList> {
  var data;
  bool loading = false;
  Map<String, dynamic> list = {
    "FirstName": "Anjana",
    "LastName": "Chauhan",
  };

  Future postdata() async {
    setState(() {
      loading = true;
    });

    http.Response response = await http
        .post(Uri.parse("https://dummyjson.com/products/add"), body: list);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
      setState(() {
        loading = false;
        print("${list}");
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Successfully Added")));
    } else {
      print("STATUS CODE ${response.statusCode}");
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ElevatedButton(
                  onPressed: () {
                    postdata();
                  },
                  child: Text("Add"),
                ),
              ));
  }
}
