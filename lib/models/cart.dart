import 'package:flutter/foundation.dart';
import 'item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];


  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  List<Item> get basketItems {
    return _items;
  }
}