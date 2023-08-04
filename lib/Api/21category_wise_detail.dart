import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_widget/Api/3product_detail.dart';

class ProductCategoriesList extends StatefulWidget {
  const ProductCategoriesList({
    Key? key,
    this.list,
  }) : super(key: key);
  final list;

  @override
  State<ProductCategoriesList> createState() => _ProductCategoriesListState();
}

class _ProductCategoriesListState extends State<ProductCategoriesList> {
  var data;

  Future<Map<String, dynamic>> getdata() async {
    http.Response response = await http.get(
        Uri.parse("https://dummyjson.com/products/category/${widget.list}"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE: ${response.body}");
    } else {
      print("STATUS CODE: ${response.statusCode}");
    }
    return data!;
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
              childAspectRatio: 0.7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // print('${snapshot.data!["products"][index]["id"]}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(
                                image:
                                    "${snapshot.data!["products"][index]["id"]}"),
                          ));
                    },
                    child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${snapshot.data!["products"][index]["thumbnail"]}"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Text("TITLE : ${snapshot.data!["products"][index]["title"]}"),
                  Text(
                      "DESCRIPTION : ${snapshot.data!["products"][index]["description"]}"),
                  Text("BRAND : ${snapshot.data!["products"][index]["brand"]}"),
                  Text(
                      "CATEGORY : ${snapshot.data!["products"][index]["category"]}"),
                ],
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
