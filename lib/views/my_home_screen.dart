import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/products.dart';
import 'cart_screen.dart';
import 'list_products_screen.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            'Tiendas RD',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartInitial && state.cartItems.isNotEmpty) {
                return IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: CartScreen(),
                        );
                      },
                    );
                  },
                );
              }
              return Container(); // O cualquier otro widget si el carrito está vacío
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: Text(
              '¡Bienvenido a Tiendas RD!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListProductsScreen(),
                    ),
                  );
                },
                child: Text('Ir a la vista de productos'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
