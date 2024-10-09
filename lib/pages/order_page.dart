import 'package:bubble_tea_app/models/drink.dart';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize Sweet
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize Ice
  double iceValue = 0.5;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customize Pearls
  double pearlValue = 0.5;
  void customizePearl(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  // add To Cart
  void addToCart() {
    // Firstly, add to cart
    Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

    // Direct user back to the shop page
    Navigator.pop(context);

    // Let user know it has successfully been added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.brown[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        title: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green, // Success icon
            ),
            SizedBox(width: 10), // Spacing between icon and text
            Text(
              'Success',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: const Text(
          'Item has been successfully added to your cart!',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.brown, // Button text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.drink.name,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
        // Customize the back arrow color
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      backgroundColor: Colors.brown[200],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // drink image
            Image.asset(
              widget.drink.imagePath,
              width: 200,
            ),

            // slider to customize
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // sweetness slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text('Sweet'),
                      ),
                      Expanded(
                        child: Slider(
                          value: sweetValue,
                          label: sweetValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeSweet(value),
                          thumbColor: Colors.brown,
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),
                  // ice slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text('Ice'),
                      ),
                      Expanded(
                        child: Slider(
                          value: iceValue,
                          label: iceValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizeIce(value),
                          thumbColor: Colors.brown,
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),
                  // pearls slider
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text('Pearls'),
                      ),
                      Expanded(
                        child: Slider(
                          value: pearlValue,
                          label: pearlValue.toString(),
                          divisions: 4,
                          onChanged: (value) => customizePearl(value),
                          thumbColor: Colors.brown,
                          activeColor: Colors.brown,
                          inactiveColor: Colors.brown[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // add to cart button
            SizedBox(
              width:
                  double.infinity, // This makes the button take the full width
              height: 50,
              child: MaterialButton(
                color: Colors.brown,
                onPressed: addToCart,
                child: const Text(
                  'Add To Cart',
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
    );
  }
}
