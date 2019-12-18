import 'package:flutter/material.dart';
import 'package:market_cafe/Screens/CategoryFoodScreen.dart';
import 'package:market_cafe/Widgets/CategoryItem.dart';
import 'package:get_it/get_it.dart';
import '../States/Menu.dart';

class MenuScreen extends StatelessWidget {
  final menu = GetIt.instance.get<Menu>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Menu"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(4),
            child: StreamBuilder(
                stream: menu.stream$,
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    return Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: <Widget>[
                        for (var i = 0; i < snap.data.length; i++)
                          InkWell(
                            child: CategoryItem(
                              index: i,
                              title: snap.data[i].title,
                              image: snap.data[i].image,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryFoodScreen(
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
                }),
          ),
        ));
  }
}
