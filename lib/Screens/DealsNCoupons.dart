import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:market_cafe/Http/dio.dart';
import 'package:market_cafe/States/Notices.dart';
import 'package:market_cafe/Widgets/Notice.dart';

class DealsNCoupons extends StatefulWidget {
  @override
  _DealsNCouponsState createState() => _DealsNCouponsState();
}

class _DealsNCouponsState extends State<DealsNCoupons> {
  final notices = GetIt.instance.get<Notices>();
  bool _loaded = false;

  init() async {
    try {
      Dio dio = DioMod().getInstance();
      List<NoticeSchema> newNotices = [];

      Response response = await dio.get("/notice");

      print(response);

      for (var x in response.data) {
        newNotices.add(
          NoticeSchema(
            title: x['title'],
            description: x['description'],
          ),
        );
      }

      notices.setNotices(newNotices);
      this.setState(() {
        _loaded = true;
      });
    } catch (err) {
      print(err);
    }
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
                  "Deals and Coupons",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                background: Container(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "images/deals.jpg",
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
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.whatshot,
                            color: Colors.orange,
                            size: 48,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Text(
                              "Deals, coupon codes and other offers shall appear here. Make sure you subscribe our app to get yourself updated about our latest offers.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<Object>(
                      stream: notices.stream$,
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        return (snap.hasData && _loaded)
                            ? Column(
                                children: <Widget>[
                                  if (snap.data.length == 0)
                                    Card(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.info,
                                              color: Colors.blue,
                                              size: 48,
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "No deals and coupons are available at this time.",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  for (NoticeSchema n in snap.data)
                                    Notice(
                                      title: n.title,
                                      description: n.description,
                                    ),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 16,
                                  ),
                                  CircularProgressIndicator(),
                                ],
                              );
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
