import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:market_cafe/States/AppInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final appInfo = GetIt.instance.get<AppInfo>();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      Icons.phone,
                      size: 36,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Contact Us",
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
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 8,
                  ),
                  Text(appInfo.current['Address']),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.phone),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    child: Text(appInfo.current['ContactNumber']),
                    onTap: () {
                      launchURL("tel:${appInfo.current['ContactNumber']}");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                child: Image.asset("images/map.jpg", fit: BoxFit.cover),
                onTap: () {
                  launchURL(appInfo.current['MapURL']);
                },
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 48,
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    "Get Directions",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    launchURL(appInfo.current['MapURL']);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
