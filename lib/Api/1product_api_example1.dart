import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_widget/Api/2all_categories.dart';
import 'package:http/http.dart' as https;
import 'package:new_widget/Api/3product_detail.dart';

class ProductApiExample1 extends StatefulWidget {
  const ProductApiExample1({Key? key}) : super(key: key);

  @override
  State<ProductApiExample1> createState() => _ProductApiExample1State();
}

class _ProductApiExample1State extends State<ProductApiExample1> {
  var data;

  Future<List> getdata1() async {
    https.Response response =
        await https.get(Uri.parse("https://dummyjson.com/products/categories"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE: ${response.body}");
    } else {
      print("STATUS CODE: ${response.statusCode}");
    }
    return data;
  }

  Future<Map<String, dynamic>> getdata() async {
    https.Response response =
        await https.get(Uri.parse("https://dummyjson.com/products"));

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories :",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductApiExampleCategories(),
                          ));
                    });
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          FutureBuilder<List>(
            future: getdata1(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Row(
                  children: List.generate(
                      4,
                      (index) => Container(
                            height: 50,
                            width: 85,
                            margin: EdgeInsets.only(left: 5, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.teal.shade200,
                            ),
                            child: Center(
                              child: Text(
                                "${snapshot.data![index]}",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          )),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Products :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FutureBuilder<Map<String, dynamic>>(
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
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailPage(
                                                image:
                                                    snapshot.data!["products"]
                                                        [index]["id"],
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
