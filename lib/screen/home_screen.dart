import 'package:flutter/material.dart';

import '../Widgets/product_item.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'ساعة ذكية',
      description: 'ساعة ذكية متعددة الوظائف',
      price: 250.0,
      image: 'https://via.placeholder.com/150',
    ),
    ProductModel(
      id: 2,
      name: 'سماعة بلوتوث',
      description: 'سماعة بجودة صوت عالية',
      price: 150.0,
      image: 'https://via.placeholder.com/150',
    ),
  ];

   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المنتجات'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}
