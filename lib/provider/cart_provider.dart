import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/items.dart';

class CartProvider with ChangeNotifier{

   List<Item>items=[];

  void addToFavourite(Item item){
    items.add(item);
    notifyListeners();
  }
   void removeFromFavourite(Item item){
     items.remove(item);
     notifyListeners();
   }

  int get lengthItems{
    return items.length;
  }
  List<Item>get cartItem{
    return items;
  }


}