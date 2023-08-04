import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PatchApiDemo extends StatefulWidget {
  const PatchApiDemo({Key? key}) : super(key: key);

  @override
  State<PatchApiDemo> createState() => _PatchApiDemoState();
}

class _PatchApiDemoState extends State<PatchApiDemo> {
  var data;
  bool loading = false;

  Future patchdata() async {
    setState(() {
      loading = true;
    });
    http.Response response =
        await http.patch(Uri.parse("https://dummyjson.com/products/1"), body: {
      "title": "I phone phone",
      "price": "80000",
      "stock": "50",
      "rating": "5.00",
      "brand": "Apple phone",
      "category": "smartphone11"
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
                    patchdata();
                  },
                  child: Text("Patch"),
                ),
              ));
  }
}
