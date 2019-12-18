import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class Dish {
  final int id;
  final String title, description;
  final double price;

  Dish({
    this.id,
    this.title,
    this.description,
    this.price,
  });
}

class Category {
  final int id;
  final String image, title, description;
  final List<Dish> dishes;

  Category({this.id, this.image, this.title, this.dishes, this.description});
}

class Menu {
  BehaviorSubject<List<Category>> _menu = BehaviorSubject.seeded([]);

  Observable get stream$ => _menu.stream;

  List<Category> get current => _menu.value;

  setMenu(List<Category> category) {
    _menu.add(category);
  }
}
