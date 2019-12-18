import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String name, review;

  Review({this.name, this.review});

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
                    "$name",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                    ],
                  )),
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
                child: Text("$review"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
