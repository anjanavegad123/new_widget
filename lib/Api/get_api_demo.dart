import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_widget/Api/show_detail_api.dart';

class GetApiDemo extends StatefulWidget {
  const GetApiDemo({Key? key}) : super(key: key);

  @override
  State<GetApiDemo> createState() => _GetApiDemoState();
}

class _GetApiDemoState extends State<GetApiDemo> {
  var data;
  int select = 0;

  Future getdata() async {
    https.Response response = await https
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONSE ${response.body}");
    } else {
      print("STATUS CODE ${response.statusCode}");
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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "USER_ID : ${snapshot.data[index]["userId"]}",
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                      // ),
                      Center(
                        child: InkWell(
                            onTap: () {
                              select = index;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Show_Detail(
                                      displaydata: snapshot.data[index]['id'],
                                    ),
                                  ));
                            },
                            child: Text(
                              "ID : ${snapshot.data[index]["id"]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                      // Text("TITLE : ${snapshot.data[index]["title"]}"),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: SingleChildScrollView(
                      //         scrollDirection: Axis.horizontal,
                      //         child: Text(
                      //           "BODY : ${snapshot.data[index]["body"]}",
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
