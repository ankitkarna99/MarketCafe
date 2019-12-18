import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatelessWidget {
  final String url, tag;
  ImageViewerScreen({this.url, this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Center(
                child: Hero(
                  tag: tag,
                  child: Image(
                    image: CachedNetworkImageProvider(url),
                    width: MediaQuery.of(context).size.width,
                    height: ((MediaQuery.of(context).size.width) / 4) * 3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
