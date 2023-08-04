import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_widget/Api/3product_detail.dart';

class ProductApiExample extends StatefulWidget {
  const ProductApiExample({Key? key}) : super(key: key);

  @override
  State<ProductApiExample> createState() => _ProductApiExampleState();
}

class _ProductApiExampleState extends State<ProductApiExample> {
  var data;

  Future<Map<String, dynamic>> getdata() async {
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE : ${response.body}");
    } else {
      print("STATUS CODE : ${response.statusCode}");
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Map<String, dynamic>>(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            itemCount: snapshot.data!["products"].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                width: 200,
                color: Colors.grey.shade200,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailPage(
                                      image: snapshot.data!["products"][index]
                                          ["id"],
                                    )),
                          );
                        });
                      },
                      child: Image.network(
                        "${snapshot.data!["products"][index]["thumbnail"]}",
                        fit: BoxFit.fill,
                        height: 130,
                        width: 300,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Title : ${snapshot.data!["products"][index]["title"]}"),
                    Text(
                        "Description : ${snapshot.data!["products"][index]["description"]}"),
                    Text(
                        "Brand : ${snapshot.data!["products"][index]["brand"]}"),
                    Text(
                        "category : ${snapshot.data!["products"][index]["category"]}"),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
