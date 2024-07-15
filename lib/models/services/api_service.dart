// lib/models/services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../products.dart'; // Importa el archivo de productos correctamente

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> addProduct(Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/models/services/api_service.dart';
// import 'package:flutter_application_1/models/products.dart';
// // import 'models/services/api_service.dart';
// import 'models/products.dart'; // Asegúrate de importar correctamente tus productos

// class ProductsScreen extends StatefulWidget {
//   final ApiService apiService;

//   ProductsScreen({required this.apiService});

//   @override
//   _ProductsScreenState createState() => _ProductsScreenState();
// }

// class _ProductsScreenState extends State<ProductsScreen> {
//   List<Product> products = [];
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final productList = await widget.apiService.getProducts();
//       setState(() {
//         products = productList;
//         isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching products: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Lista de Productos'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text('Precio: \$${product.price}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       // Implementar la lógica para eliminar producto
//                     },
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navegar a la pantalla para añadir un nuevo producto
//         },
//         tooltip: 'Añadir Producto',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
