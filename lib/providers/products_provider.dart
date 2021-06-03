import 'package:flutter/Material.dart';
import '../models/product.dart';
class Products with ChangeNotifier{
  List<Product> _items=[];
  List<Product> get items{
    return [..._items];
  }

  void addProducts(){
    notifyListeners();
  }
}