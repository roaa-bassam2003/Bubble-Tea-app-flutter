import 'package:bubble_tea_app/models/drink.dart';
import 'package:flutter/material.dart';

class BubbleTeaShop extends ChangeNotifier {
  // list of drinks for sale
  final List<Drink> _shop = [
    Drink(
      name: 'Pearl Milk Tea',
      price: '\$4.00',
      imagePath: 'lib/assets/pearl_milk.png',
    ),
    Drink(
      name: 'Taro Milk Tea',
      price: '\$5.00',
      imagePath: 'lib/assets/taro_milk.png',
    ),
    Drink(
      name: 'Green Tea',
      price: '\$7.60',
      imagePath: 'lib/assets/green.png',
    ),
    Drink(
      name: 'Cream Tea',
      price: '\$3.90',
      imagePath: 'lib/assets/cream.png',
    ),
    Drink(
      name: 'Choco Tea',
      price: '\$6.40',
      imagePath: 'lib/assets/choco.png',
    ),
    Drink(
      name: 'Black Bean Milk Tea',
      price: '\$9.20',
      imagePath: 'lib/assets/black_bean.png',
    ),
  ];

  // list of drinks in user cart
  final List<Drink> _userCart = [];

  // get drinks for sale
  List<Drink> get shop => _shop;

  // get user cart
  List<Drink> get cart => _userCart;

  // add drink to cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  // remove drink from cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
