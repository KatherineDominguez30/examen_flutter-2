part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Product> availableProducts;
  final Map<Product, int> cartItems;

  CartLoaded(this.availableProducts, this.cartItems);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartInitial extends CartState {
  final List<Product> availableProducts;
  final Map<Product, int> cartItems;

  CartInitial(this.availableProducts, this.cartItems);
}
