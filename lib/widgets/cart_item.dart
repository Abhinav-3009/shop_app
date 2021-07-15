import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String prodId;
  final int quantity;
  final String title;
  CartItem({this.id, this.price, this.quantity, this.title, this.prodId});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(prodId),
      background: Container(
        color: Theme.of(context).accentColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 45,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.all(16),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you Sure?'),
                  content: Text('Do you really want to remove the item?'),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop(false);
                    }, child: Text("NO")),
                    TextButton(onPressed: (){
                      Navigator.of(ctx).pop(true);
                    }, child: Text("YES")),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(prodId);
      },
      child: Card(
        margin: EdgeInsets.all(16),
        elevation: 12,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text('\$$price')),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
