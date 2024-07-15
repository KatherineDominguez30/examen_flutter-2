class Product {
  final String name;
  final String marca;
  final String descripcion;
  final String uso;
  final double price;
  final int stock;

  Product({
    required this.name,
    required this.marca,
    required this.descripcion,
    required this.uso,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      marca: json['marca'],
      descripcion: json['descripcion'],
      uso: json['uso'],
      price: json['price'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'marca': marca,
      'descripcion': descripcion,
      'uso': uso,
      'price': price,
      'stock': stock,
    };
  }
}
