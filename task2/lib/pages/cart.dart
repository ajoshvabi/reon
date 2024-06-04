import 'package:flutter/material.dart';
import 'package:task2/db.dart';
import 'package:task2/pages/products.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  DatabaseHelper db = DatabaseHelper();
  List<Map<String, dynamic>> cartData = [];

  @override
  void initState() {
    _loadCartData();
    super.initState();
  }

  void _loadCartData() async {
    List<Map<String, dynamic>> data = await db.getCart();
    setState(() {
      cartData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  final product = cartData[index];
                  return Product(product: product, status: true);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
