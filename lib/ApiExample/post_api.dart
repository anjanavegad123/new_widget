import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostApiDemo extends StatefulWidget {
  const PostApiDemo({Key? key}) : super(key: key);

  @override
  State<PostApiDemo> createState() => _PostApiDemoState();
}

class _PostApiDemoState extends State<PostApiDemo> {
  var data;
  bool loading = false;

  Future postdata() async {
    setState(() {
      loading = true;
    });
    http.Response response =
        await http.post(Uri.parse("https://dummyjson.com/products/add"), body: {
      "title": "Chauhan",
      "price": "5000",
    });

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
      setState(() {
        loading = false;
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
