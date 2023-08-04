import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WithoutFutureBuilderSearchProduct extends StatefulWidget {
  const WithoutFutureBuilderSearchProduct({Key? key}) : super(key: key);

  @override
  State<WithoutFutureBuilderSearchProduct> createState() =>
      _WithoutFutureBuilderSearchProductState();
}

class _WithoutFutureBuilderSearchProductState
    extends State<WithoutFutureBuilderSearchProduct> {
  var data;
  bool loading = false;
  bool error = false;

  Future getdata(String value) async {
    setState(() {
      loading = true;
    });

    http.Response response = await http.get(
      Uri.parse("https://dummyjson.com/products/search?q=$value"),
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      setState(() {
        loading = false;
      });
      print("RESPONSE: ${response.body}");
    } else {
      print("STATUS CODE : ${response.statusCode}");

      setState(() {
        loading = false;
        error = true;
      });
    }
  }

  TextEditingController txtcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getdata(txtcontroller.text);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              TextFormField(
                controller: txtcontroller,
                decoration: InputDecoration(
                  constraints: BoxConstraints.expand(width: 400, height: 50),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              SizedBox(height: 30),
              loading
                  ? CircularProgressIndicator()
                  : error
                      ? Text('error found')
                      : data == null
                          ? Text("No data")
                          : data["total"] == 0
                              ? Text("No match found")
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      data['products'].length,
                                      (index) => Column(
                                            children: [
                                              Text(
                                                  "ID: ${data['products'][index]['id']}"),
                                              Text(
                                                  "Title: ${data['products'][index]['title']}"),
                                              Text(
                                                  "Description:${data['products'][index]['description']}"),
                                              Text(
                                                  "Price:${data['products'][index]['price']}"),
                                            ],
                                          )),
                                ),
            ],
          ),
        ),
      ),
    );
  }
}
