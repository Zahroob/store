import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';

class CartCubit extends Cubit<List<ProductModel>> {
  CartCubit() : super([]);

  void addToCart(ProductModel product) {
    final updatedList = [...state, product];
    emit(updatedList);
  }

  void removeFromCart(ProductModel product) {
    final updatedList = state.where((p) => p.id != product.id).toList();
    emit(updatedList);
  }

  void clearCart() {
    emit([]);
  }
}
