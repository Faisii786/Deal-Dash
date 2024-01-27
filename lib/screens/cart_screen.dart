import 'package:e_commerce_app/Model/cart_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.purple,
            title: Text(cart.items[index].name),
            subtitle: Text('\$${cart.items[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
