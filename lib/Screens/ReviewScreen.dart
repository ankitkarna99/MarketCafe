import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market_cafe/Http/dio.dart';
import 'package:market_cafe/Widgets/Review.dart';

class ReviewSchema {
  final String name, review;

  ReviewSchema({this.name, this.review});
}

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  List<ReviewSchema> reviews = [];

  init() async {
    try {
      Dio dio = DioMod().getInstance();
      Response response = await dio.get("/review");

      List<ReviewSchema> newReviews = [];

      for (var x in response.data) {
        newReviews.add(ReviewSchema(name: x['name'], review: x['review']));
      }

      this.setState(() {
        reviews = newReviews;
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
                  "User Reviews",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                background: Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "images/reviews.jpg",
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
          ];
        },
        body: SingleChildScrollView(
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  (reviews.length > 0)
                      ? Column(
                          children: <Widget>[
                            for (ReviewSchema x in reviews)
                              Review(
                                name: x.name,
                                review: x.review,
                              )
                          ],
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }
}
