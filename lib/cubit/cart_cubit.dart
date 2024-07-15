import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/products.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  final List<Product> availableProducts = [
    Product(
      name: 'Detergente',
      marca: 'Marca A',
      descripcion: 'Detergente para ropa.',
      uso: 'Ideal para lavar la ropa sucia.',
      price: 100.0,
      stock: 10,
    ),
    Product(
      name: 'Desinfectante',
      marca: 'Marca B',
      descripcion: 'Desinfectante multiusos.',
      uso: 'Para desinfectar superficies y objetos.',
      price: 150.0,
      stock: 5,
    ),
    Product(
      name: 'Jabón para manos',
      marca: 'Marca C',
      descripcion: 'Jabón líquido antibacterial.',
      uso: 'Limpieza y protección de las manos.',
      price: 50.0,
      stock: 20,
    ),
    Product(
      name: 'Limpia vidrios',
      marca: 'Marca D',
      descripcion: 'Limpiador para ventanas y espejos.',
      uso: 'Para obtener superficies limpias y brillantes.',
      price: 120.0,
      stock: 8,
    ),
    Product(
      name: 'Toallas desinfectantes',
      marca: 'Marca E',
      descripcion: 'Toallas húmedas desechables.',
      uso: 'Limpieza rápida de superficies.',
      price: 60.0,
      stock: 15,
    ),
    Product(
      name: 'Esponja abrasiva',
      marca: 'Marca F',
      descripcion: 'Esponja para limpieza de utensilios.',
      uso: 'Eliminar suciedad adherida en utensilios de cocina.',
      price: 30.0,
      stock: 25,
    ),
    Product(
      name: 'Escoba',
      marca: 'Marca G',
      descripcion: 'Escoba de cerdas resistentes.',
      uso: 'Limpieza de pisos y áreas amplias.',
      price: 90.0,
      stock: 7,
    ),
    Product(
      name: 'Trapo de microfibra',
      marca: 'Marca H',
      descripcion: 'Trapo absorbente de microfibra.',
      uso: 'Para limpieza de superficies delicadas.',
      price: 40.0,
      stock: 18,
    ),
    Product(
      name: 'Limpiador multiusos',
      marca: 'Marca I',
      descripcion: 'Limpiador concentrado.',
      uso: 'Para limpieza de superficies delicadas.',
      price: 80.0,
      stock: 12,
    ),
  ];

  void fetchProducts() async {
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulo un retraso
      emit(CartLoaded(availableProducts, {}));
    } catch (e) {
      emit(CartError('Failed to fetch products'));
    }
  }

  void addItem(Product product, int quantity) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final cartItems = Map<Product, int>.from(currentState.cartItems);

      if (cartItems.containsKey(product)) {
        cartItems[product] = cartItems[product]! + quantity;
      } else {
        cartItems[product] = quantity;
      }

      emit(CartLoaded(currentState.availableProducts, cartItems));
    }
  }

  void removeItem(Product product) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final cartItems = Map<Product, int>.from(currentState.cartItems);

      if (cartItems.containsKey(product)) {
        if (cartItems[product]! > 1) {
          cartItems[product] = cartItems[product]! - 1;
        } else {
          cartItems.remove(product);
        }
      }

      emit(CartLoaded(currentState.availableProducts, cartItems));
    }
  }
}
