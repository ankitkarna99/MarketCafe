import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_cafe/Widgets/DishItem.dart';
import 'package:get_it/get_it.dart';
import "../States/Menu.dart";

class CategoryFoodScreen extends StatelessWidget {
  final String url, title, description;
  final int index;
  final int categoryId;

  CategoryFoodScreen(
      {this.url, this.index, this.title, this.categoryId, this.description});

  final menu = GetIt.instance.get<Menu>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                background: Container(
                  child: Hero(
                    tag: "image" + index.toString(),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          image: CachedNetworkImageProvider(url),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.black38,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            StreamBuilder(
                stream: menu.stream$,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    final dishes = snap.data[index].dishes;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (description.length > 0)
                          Container(
                            padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
                            child: Text(
                              this.description,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        for (var dish in dishes)
                          DishItem(
                            dish: dish,
                            categoryId: categoryId,
                          ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
