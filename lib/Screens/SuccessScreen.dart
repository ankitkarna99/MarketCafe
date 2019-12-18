import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String message;

  SuccessScreen({this.message});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text("Subscription"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32, bottom: 64),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/check.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width / 3,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
