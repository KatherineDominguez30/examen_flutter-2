import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/products.dart';
import '../cubit/cart_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  DetailsScreen({required this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${widget.product.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Marca: ${widget.product.marca}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Descripción: ${widget.product.descripcion}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Uso: ${widget.product.uso}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Precio: \$${widget.product.price}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Stock: ${widget.product.stock}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) _quantity--;
                    });
                  },
                ),
                Text('$_quantity', style: TextStyle(fontSize: 24)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      if (_quantity < widget.product.stock) _quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().addItem(widget.product, _quantity);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Añadido ${widget.product.name} al carrito, Cantidad: $_quantity'),
                    ),
                  );
                },
                child: Text('Añadir al Carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
