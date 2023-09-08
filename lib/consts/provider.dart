import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  bool isItemSLected = false;
  int _selectedItemIndex=0;

void selectedItemIndex(value){
  _selectedItemIndex=value;
  notifyListeners();
}
int getItemIndex(){
  return _selectedItemIndex;
}

  void isItemSelected(value) {
    isItemSLected = value;
    notifyListeners();
  }

  bool getItemSelected() {
    return isItemSLected;
  }

  void langChanged() {
    notifyListeners();
  }
}
