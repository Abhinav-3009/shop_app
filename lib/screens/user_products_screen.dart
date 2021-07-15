import 'package:flutter/material.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userProductsScreen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, index) => Column(
            children: [
              UserProductItem(
                title: productsData.items[index].title,
                imageUrl: productsData.items[index].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
