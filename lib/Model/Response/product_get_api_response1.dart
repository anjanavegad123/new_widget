import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_widget/Api/3product_detail.dart';
import 'package:new_widget/Model/Response/post_response_model.dart';
import 'package:new_widget/Model/Response/product_response_model1.dart';

class GetApiResponse1 extends StatefulWidget {
  const GetApiResponse1({Key? key}) : super(key: key);

  @override
  State<GetApiResponse1> createState() => _GetApiResponse1State();
}

class _GetApiResponse1State extends State<GetApiResponse1> {
  ProductResponseModel? productResponseModel;

  Future<ProductResponseModel> getdata() async {
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products"));

    if (response.statusCode == 200) {
      productResponseModel = productResponseModelFromJson(response.body);

      print("RESPONSE : ${response.body}");
    } else {
      print("STATUS CODE : ${response.statusCode}");
    }
    return productResponseModel!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ProductResponseModel>(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.builder(
            itemCount: snapshot.data?.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              Product product = snapshot.data!.products[index];

              return Container(
                height: 300,
                width: 200,
                color: Colors.grey.shade200,
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "${product.thumbnail}",
                      // upper and lower both are same...Product.thumbnail using Product object....
                      // "${snapshot.data!.products[index].thumbnail}",
                      fit: BoxFit.fill,
                      height: 130,
                      width: 300,
                    ),
                    SizedBox(height: 10),
                    Text("Title : ${product.title}"),
                    Text("Description : ${product.description}"),
                    Text("Brand : ${product.brand}"),
                    Text("category : ${product.category}"),
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
