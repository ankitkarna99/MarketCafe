import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  final Function launchURL;

  Copyright({this.launchURL});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Copyright © 2019/2020 Market Cafe. All right reserved.",
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "App Powered By: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    child: Text(
                      "NA Web LLC",
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                    onTap: () {
                      launchURL("https://nawebllc.com/");
                    },
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
