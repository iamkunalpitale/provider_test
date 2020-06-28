import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/models/cart.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text(' Item Detail Page'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      Text(cart.count.toString())
                    ],
                  ),
                ),
              ],
            ),
            body: cart.basketItems.length == 0
                ? Text('no items ')
                : ListView.builder(
              itemCount: cart.basketItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(cart.basketItems[index].title),
                    subtitle:
                    Text(cart.basketItems[index].price.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        cart.add(cart.basketItems[index]);
                      },
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}