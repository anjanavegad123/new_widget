import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var data;
  bool loading = false;
  String error = '';

  Future getdata(String value) async {
    setState(() {
      loading = true;
    });
    http.Response response = await http
        .get(Uri.parse("https://dummyjson.com/products/search?q=$value"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      setState(() {
        loading = false;
      });
      print("RESPONSE : ${response.body}");
    } else {
      print("STATUS CODE : ${response.statusCode}");

      setState(() {
        loading = false;
        error = "something went wrong";
      });
    }
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getdata(search.text);
        },
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: search,
          ),
          loading
              ? const CircularProgressIndicator()
              : error != ''
                  ? Text(error)
                  : data == null
                      ? const Text('No Data')
                      : data['total'] == 0
                          ? Text('No Match Found')
                          : Text('${data}'),
        ],
      )),
    );
  }
}
