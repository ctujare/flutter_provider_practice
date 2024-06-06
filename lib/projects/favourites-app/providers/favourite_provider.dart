import 'package:flutter/material.dart';

class FavouriteItems extends ChangeNotifier {
  List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void addItem(int item) {
    _selectedItems.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    _selectedItems.remove(item);
    notifyListeners();
  }
}
