import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:market_cafe/States/AppInfo.dart';

class BusinessHours extends StatelessWidget {
  final appInfo = GetIt.instance.get<AppInfo>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 36,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Business Hours",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/sun.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['SUNDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/mon.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['MONDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/tue.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['TUESDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/wed.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['WEDNESDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/thu.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['THURSDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/fri.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['FRIDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    "images/Days/sat.png",
                    width: 32,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    appInfo.current['SATURDAY'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
