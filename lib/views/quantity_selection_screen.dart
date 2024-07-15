import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/products.dart';
import 'details_screen.dart';

class QuantitySelectionScreen extends StatefulWidget {
  final Product product;

  QuantitySelectionScreen({required this.product});

  @override
  _QuantitySelectionScreenState createState() =>
      _QuantitySelectionScreenState();
}

class _QuantitySelectionScreenState extends State<QuantitySelectionScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quantity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Quantity for ${widget.product.name}:'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().addItem(widget.product, quantity);
                Navigator.pop(
                    context); // Regreso la pantalla anterior (DetailsScreen)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Añadido ${widget.product.name} al carrito, Cantidad: $quantity'),
                  ),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
