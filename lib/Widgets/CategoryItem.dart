import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  @required
  final String title, image;
  final int index;

  CategoryItem({this.image, this.title, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 12) / 2,
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              Hero(
                tag: "image" + index.toString(),
                child: Stack(
                  children: <Widget>[
                    Image(
                      image: CachedNetworkImageProvider(image),
                      height:
                          (((MediaQuery.of(context).size.width - 12) / 2) / 4) *
                              2.25,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container()
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
