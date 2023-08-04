import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_widget/Model/Response/post_response_model.dart';

class GetApiResponse extends StatefulWidget {
  const GetApiResponse({Key? key, this.displaydata}) : super(key: key);
  final displaydata;
  @override
  State<GetApiResponse> createState() => _GetApiResponseState();
}

class _GetApiResponseState extends State<GetApiResponse> {
  List<PostResponseModel>? postResponseModel;

  Future<List<PostResponseModel>> getdata() async {
    https.Response response = await https
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      postResponseModel = postResponseModelFromJson(response.body);
      print("RESPONSE ${response.body}");
    } else {
      print("STATUS CODE ${response.statusCode}");
    }
    return postResponseModel!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PostResponseModel>>(
        future: getdata(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USER_ID : ${snapshot.data![index].userId}",
                      ),
                      Text("ID : ${snapshot.data[index].id}"),
                      Text("TITLE : ${snapshot.data[index].title}"),
                      Text(
                        "BODY : ${snapshot.data[index].body}",
                      ),
                      SizedBox(height: 10),
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
    );
  }
}
