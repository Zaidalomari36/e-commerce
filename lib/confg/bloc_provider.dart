import 'package:flutter/material.dart';

class BLOCProvider with ChangeNotifier{
int _categoryid =1;
int _qty=1;
int _numOfItems=0;



int get categoryid=>_categoryid;
set categoryid(int value){
   _categoryid=value;
   notifyListeners();
 }

int get numOfItems=>_numOfItems;
set numOfItems(int value){
  _numOfItems=value;
  notifyListeners();
}



int get qty=>_qty;
set qty(int value){
  _qty=value;
  notifyListeners();
}
}