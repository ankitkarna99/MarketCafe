import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:market_cafe/Http/dio.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<String> contents = [];

  init() async {
    try {
      Dio dio = DioMod().getInstance();
      Response response = await dio.get("/keyValue/AboutUs");
      List<String> data = response.data['value'].split("<p>");
      List<String> newContents = [];
      for (String x in data) {
        if (x.trim().length > 0)
          newContents.add(x.split("</p>")[0].replaceAll("\n", ""));
      }

      this.setState(() {
        contents = newContents;
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
                  "About Us",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                background: Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "images/about.jpg",
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
              padding: EdgeInsets.all(16),
              child: (contents.length > 0)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        for (String content in contents)
                          Column(
                            children: <Widget>[
                              Text(
                                content,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )),
      ),
    );
  }
}
