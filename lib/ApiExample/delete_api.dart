import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteApiDemo extends StatefulWidget {
  const DeleteApiDemo({Key? key}) : super(key: key);

  @override
  State<DeleteApiDemo> createState() => _DeleteApiDemoState();
}

class _DeleteApiDemoState extends State<DeleteApiDemo> {
  var data;
  bool loading = false;

  Future deletedata() async {
    setState(() {
      loading = true;
    });
    http.Response response =
        await http.delete(Uri.parse("https://dummyjson.com/products/1"), body: {
      //"title": "I phone phone",
      //"price": "549",
      "brand": "Apple",
    });

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Successfully deleted")));
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
                    deletedata();
                  },
                  child: Text("Delete"),
                ),
              ));
    ;
  }
}
