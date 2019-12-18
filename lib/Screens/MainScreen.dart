import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:market_cafe/Http/dio.dart';
import 'package:market_cafe/Screens/CategoryFoodScreen.dart';
import 'package:market_cafe/States/AppInfo.dart';
import 'package:market_cafe/States/Menu.dart';
import 'package:market_cafe/Widgets/BusinessHours.dart';
import 'package:market_cafe/Widgets/CategoryItem.dart';
import 'package:market_cafe/Widgets/ContactUs.dart';
import 'package:market_cafe/Widgets/Copyright.dart';
import 'package:market_cafe/Widgets/EmailSubscribe.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final menu = GetIt.instance.get<Menu>();
  final appInfo = GetIt.instance.get<AppInfo>();

  bool _loaded = false;

  launchURL(url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (err) {
      print(err);
    }
  }

  init() async {
    try {
      List<Category> newMenu = [];
      Dio dio = DioMod().getInstance();
      List<Response> responses = await Future.wait(
          [dio.get("/category"), dio.get("/keyValue/appInfo")]);
      for (var x in responses[0].data) {
        List<Dish> dishes = [];
        for (var d in x['dishes']) {
          dishes.add(Dish(
            id: d['id'],
            title: d['title'],
            description: d['description'],
            price: double.parse(d['price']),
          ));
        }
        newMenu.add(
          Category(
            id: x['id'],
            image: dio.options.baseUrl + x['image'],
            title: x['title'],
            dishes: dishes,
            description: x['description'],
          ),
        );
      }

      Map<String, String> newAppInfo = {};
      for (var x in responses[1].data) {
        newAppInfo[x['key']] = x['value'];
      }

      appInfo.setInfo(newAppInfo);

      menu.setMenu(newMenu);
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    "images/drawerHeader.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    color: Colors.black38,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          color: Colors.black.withOpacity(0.5),
                          elevation: 8.0,
                          clipBehavior: Clip.antiAlias,
                          shape: CircleBorder(),
                          child: Container(
                            padding: EdgeInsets.all(24),
                            child: Image.asset(
                              "images/logo.png",
                              width: 60,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/about");
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text('Menu'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/menu");
              },
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Order Online (Pickup)'),
              onTap: () {
                launchURL(appInfo.current['PickupURL']);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Order Online (Delivery)'),
              onTap: () {
                launchURL(appInfo.current['DeliveryURL']);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.loyalty),
              title: Text('Deals and Coupons'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/deals");
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility),
              title: Text('Catering'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/catering");
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/gallery");
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Reviews'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/reviews");
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/contact");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Market Cafe"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: (_loaded)
            ? ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 250.0,
                          child: Carousel(
                            images: [
                              Image.asset('images/Carausel/1.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/8.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/9.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/10.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/12.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/2.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/3.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/4.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/5.jpg',
                                  fit: BoxFit.cover),
                              Image.asset('images/Carausel/6.jpg',
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ),
                        Positioned(
                          left: (MediaQuery.of(context).size.width - 120) / 2,
                          top: 12,
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Card(
                                color: Colors.black.withOpacity(0.5),
                                elevation: 8.0,
                                clipBehavior: Clip.antiAlias,
                                shape: CircleBorder(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Image.asset(
                                    "images/logo.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Food Categories",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    child: StreamBuilder(
                      stream: menu.stream$,
                      builder: (BuildContext context, AsyncSnapshot snap) {
                        if (snap.hasData) {
                          int limitter =
                              snap.data.length > 6 ? 6 : snap.data.length;
                          return Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: <Widget>[
                              for (int i = 0; i < limitter; i++)
                                InkWell(
                                  child: CategoryItem(
                                    title: snap.data[i].title,
                                    image: snap.data[i].image,
                                    index: i,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryFoodScreen(
                                          url: snap.data[i].image,
                                          index: i,
                                          title: snap.data[i].title,
                                          categoryId: snap.data[i].id,
                                          description: snap.data[i].description,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: FlatButton(
                          textColor: Colors.blue,
                          onPressed: () {
                            Navigator.pushNamed(context, "/menu");
                          },
                          child: Text("View More"),
                        ),
                      )
                    ],
                  ),
                  EmailSubscribe(),
                  BusinessHours(),
                  ContactUs(),
                  Copyright(launchURL: this.launchURL),
                ],
              )
            : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
