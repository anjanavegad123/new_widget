import 'dart:ui';

import 'package:flutter/material.dart';

class Image_Filtered extends StatefulWidget {
  const Image_Filtered({Key? key}) : super(key: key);

  @override
  State<Image_Filtered> createState() => _Image_FilteredState();
}

class _Image_FilteredState extends State<Image_Filtered> {
  double sigma = 0;
  double rotation = 0;
  double inner = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1431411207774-da3c7311b5e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                      ),
                      fit: BoxFit.fill),
                ),
              )),
          ImageFiltered(
              imageFilter: ImageFilter.matrix(Matrix4.rotationZ(rotation)
                  .storage), //matrix ma rotationX,rotationY,rotationZ,skew,skewX,skewY
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1431411207774-da3c7311b5e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                      ),
                      fit: BoxFit.fill),
                ),
              )),
          // ImageFiltered(
          //     imageFilter: ImageFilter.compose(outer: outer, inner: inner),
          //     child: Text("Hello ImageFilterred")),

          Slider(
              value: sigma,
              min: 0,
              max: 10,
              divisions: 10,
              label: "${sigma.toStringAsFixed(0)}",
              onChanged: (value) {
                setState(() {
                  sigma = value;
                });
              }),
          Slider(
              min: 0,
              max: 20,
              label: "${rotation.toStringAsFixed(0)}",
              value: rotation,
              onChanged: (value) {
                setState(() {
                  rotation = value;
                });
              })
        ],
      ),
    );
  }
}
