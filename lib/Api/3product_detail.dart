import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    this.image,
  }) : super(key: key);
  final image;
  // final displaydata;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var data;
  Future getdata() async {
    http.Response response = await http
        .get(Uri.parse("https://dummyjson.com/products/${widget.image}"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("Response:${response.body}");
    } else {
      print("StatusCode: ${response.statusCode}");
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Container(
                  height: 250,
                  width: 410,
                  color: Colors.grey.shade200,
                  child: PageView.builder(
                    itemCount: snapshot.data!["images"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "${snapshot.data["images"][index]}",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 410,
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title : ${snapshot.data!["id"]}"),
                        Text("Description : ${snapshot.data!["description"]}"),
                        Text("Price : ${snapshot.data!["price"]}"),
                        Text("Rating : ${snapshot.data!["rating"]}"),
                        Text("Brand : ${snapshot.data!["brand"]}"),
                        Text("Category : ${snapshot.data!["category"]}"),
                      ],
                    ),
                  ),
                )
              ],
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
