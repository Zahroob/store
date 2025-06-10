import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('سلة المشتريات')),
      body: BlocBuilder<CartCubit, List<ProductModel>>(
        builder: (context, cartItems) {
          if (cartItems.isEmpty) {
            return Center(child: Text('السلة فارغة'));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text('${item.price} جنيه'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<CartCubit>().removeFromCart(item);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
