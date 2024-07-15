import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/products.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;

            if (cartItems.isEmpty) {
              return Center(child: Text('El carrito está vacío'));
            }

            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems.keys.elementAt(index);
                final quantity = cartItems[product]!;
                final totalPrice = product.price * quantity;

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Cantidad: $quantity'),
                  trailing: Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Algo salió mal'));
        },
      ),
    );
  }
}
