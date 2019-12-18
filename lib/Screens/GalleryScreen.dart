import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market_cafe/Http/dio.dart';

import 'ImageViewerScreen.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> images = [];

  init() async {
    try {
      Dio dio = DioMod().getInstance();
      Response response = await dio.get("/gallery");

      List<String> newImages = [];
      for (var x in response.data) {
        newImages.add(x['url']);
      }

      this.setState(() {
        images = newImages;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    this.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Gallery"),
      ),
      body: ListView(
        children: <Widget>[
          (images.length > 0)
              ? Container(
                  padding: EdgeInsets.all(8),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      for (var i = 0; i < images.length; i++)
                        InkWell(
                          child: Hero(
                            tag: "image" + i.toString(),
                            child: Image(
                              image: CachedNetworkImageProvider(images[i]),
                              width:
                                  (MediaQuery.of(context).size.width - 24) / 2,
                              height:
                                  (((MediaQuery.of(context).size.width - 24) /
                                              2) /
                                          4) *
                                      3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewerScreen(
                                    url: images[i],
                                    tag: "image" + i.toString()),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ],
      ),
    );
  }
}
