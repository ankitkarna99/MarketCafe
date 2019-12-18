import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import "../States/Menu.dart";

class DishItem extends StatelessWidget {
  final Dish dish;
  final int categoryId;

  DishItem({this.dish, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(12, 20, 12, 4),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)))),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              dish.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          if (dish.description.length > 0)
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    dish.description,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '\$ ' + dish.price.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
