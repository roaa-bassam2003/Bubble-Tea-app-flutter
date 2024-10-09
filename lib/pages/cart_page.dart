import 'package:bubble_tea_app/components/drink_tile.dart';
import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove From Cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),

              // list of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // get individual drink in cart first
                      Drink drink = value.cart[index];
                      // return as a nice tile
                      return DrinkTile(
                        drink: drink,
                        onTap: () => removeFromCart(drink),
                        trailing: Icon(
                          Icons.delete,
                          color: Colors.grey[500],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 10),
              // pay button
              SizedBox(
                width: double
                    .infinity, // This makes the button take the full width
                height: 50,
                child: MaterialButton(
                  color: Colors.brown,
                  onPressed: () {},
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
