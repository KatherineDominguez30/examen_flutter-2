import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/products.dart';
import 'package:flutter_application_1/views/details_screen.dart';
import 'package:flutter_application_1/views/list_products_screen.dart';
import 'package:flutter_application_1/views/my_home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/details':
        if (settings.arguments != null && settings.arguments is Product) {
          return MaterialPageRoute(
            builder: (_) =>
                DetailsScreen(product: settings.arguments as Product),
          );
        }

        return _errorRoute('Argumento inválido para Detalles');

      case '/list':
        return MaterialPageRoute(builder: (_) => ListProductsScreen());

      case '/welcome':
      case '/':
        return MaterialPageRoute(builder: (_) => MyHomeScreen());

      default:
        return _errorRoute('Ruta desconocida: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
