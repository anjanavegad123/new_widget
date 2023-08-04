import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PutApiDemo extends StatefulWidget {
  const PutApiDemo({Key? key}) : super(key: key);

  @override
  State<PutApiDemo> createState() => _PutApiDemoState();
}

class _PutApiDemoState extends State<PutApiDemo> {
  var data;
  bool loading = false;

  Future putdata() async {
    setState(() {
      loading = true;
    });
    http.Response response =
        await http.put(Uri.parse("https://dummyjson.com/products/1"), body: {
      "title": "I phone 123",
      "price": "50000",
      "stock": "100",
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
                    putdata();
                  },
                  child: Text("Update"),
                ),
              ));
  }
}
