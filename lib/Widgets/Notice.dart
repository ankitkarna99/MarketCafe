import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  final String title, description;

  Notice({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$title",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Icon(
                    Icons.whatshot,
                    color: Colors.orange,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                color: Colors.black26,
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("$description"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
