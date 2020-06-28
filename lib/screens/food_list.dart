import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/models/cart.dart';
import 'package:providertest/models/item.dart';

import 'cart_item.dart';


class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final List<Item> items = [
    Item(title: 'Chapati ', price: 500.0),
    Item(title: 'Rice ', price: 400.0),
    Item(title: 'Chips ', price: 40.0),
    Item(title: 'Pizza ', price: 60.0),
    Item(title: 'Maggi ', price: 250.0),
    Item(title: 'Dal ', price: 150.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Food List'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage()));
                    },
                  ),
                  Text(cart.count.toString())
                ],
              ),
            )
          ],
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].price.toString()),
              trailing: Icon(Icons.add),
              onTap: () {
                cart.add(items[index]);
              },
            );
          },
        ),
      );
    });
  }
}