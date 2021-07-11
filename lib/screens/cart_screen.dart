import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
class CartScreen extends StatelessWidget {
  static const routeName="/cart";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Total",style: TextStyle(fontSize: 22),),
                  SizedBox(width: 12,),
                  Chip(label: Text("\$${cart.totalAmount}"),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}