class Product {
  Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;
}

class Item {
  Item({
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  double get price => product.price * quantity;
}

class Cart {}
