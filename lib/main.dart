import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:market_cafe/Screens/AboutScreen.dart';
import 'package:market_cafe/Screens/CateringScreen.dart';
import 'package:market_cafe/Screens/ContactScreen.dart';
import 'package:market_cafe/Screens/DealsNCoupons.dart';
import 'package:market_cafe/Screens/MenuScreen.dart';
import 'package:market_cafe/Screens/ReviewScreen.dart';
import 'package:market_cafe/States/AppInfo.dart';
import 'package:market_cafe/States/Notices.dart';
import 'Screens/GalleryScreen.dart';
import 'Screens/MainScreen.dart';
import 'States/Menu.dart';

GetIt getIt = GetIt.instance;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.red.shade700, // status bar color
  ));
  getIt.registerSingleton<Menu>(Menu());
  getIt.registerSingleton<Notices>(Notices());
  getIt.registerSingleton<AppInfo>(AppInfo());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MainScreen(),
        '/gallery': (context) => GalleryScreen(),
        '/menu': (context) => MenuScreen(),
        '/catering': (context) => CateringScreen(),
        '/contact': (context) => ContactScreen(),
        '/about': (context) => AboutScreen(),
        '/reviews': (context) => ReviewScreen(),
        '/deals': (context) => DealsNCoupons(),
      },
      title: 'Market Cafe',
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
    );
  }
}
