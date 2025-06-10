import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../cubit/cart_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 150)),
            SizedBox(height: 20),
            Text(product.description, style: TextStyle(fontSize: 18)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${product.price} جنيه', style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('تمت الإضافة إلى السلة')),
                    );
                  },
                  child: Text('أضف إلى السلة'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
