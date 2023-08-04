import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'categories_response_model.dart';
import 'package:http/http.dart' as https;

class Categories_api_response extends StatefulWidget {
  const Categories_api_response({Key? key}) : super(key: key);

  @override
  State<Categories_api_response> createState() =>
      _Categories_api_responseState();
}

class _Categories_api_responseState extends State<Categories_api_response> {
  List<String>? categories;

  Future getData() async {
    https.Response response =
        await https.get(Uri.parse("https://dummyjson.com/products/categories"));
    if (response.statusCode == 200) {
      categories = categoriesResponseModelFromJson(response.body);
      print("RESPONSE ${response.body}");
    }
    // else {
    //   return print("STATUS CODE ${response.statusCode}");
    // }
    return categories!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories!.length,
                itemBuilder: (context, index) {
                  return Text("${categories![index]}");
                },
              ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
