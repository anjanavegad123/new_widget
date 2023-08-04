import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_widget/Api/21category_wise_detail.dart';

class ProductApiExampleCategories extends StatefulWidget {
  const ProductApiExampleCategories({Key? key}) : super(key: key);

  @override
  State<ProductApiExampleCategories> createState() =>
      _ProductApiExampleCategoriesState();
}

class _ProductApiExampleCategoriesState
    extends State<ProductApiExampleCategories> {
  var data;
  List category = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];

  Future<List> getdata() async {
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products/category/}"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE: ${response.body}");
    } else {
      print("STATUS CODE: ${response.statusCode}");
    }
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: getdata(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: category.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductCategoriesList(
                                        list: snapshot.data![index]),
                                  ));
                            });
                          },
                          child: Container(
                            height: 70,
                            width: 300,
                            color: Colors.teal.shade200,
                            margin: EdgeInsets.all(15),
                            child: Center(
                                child: Text(
                              "${snapshot.data![index]}",
                              style: TextStyle(color: Colors.white),
                            )),
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
            )
          ],
        ),
      ),
    );
  }
}
