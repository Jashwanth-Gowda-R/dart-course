import 'package:test/productClass.dart';

class Item {
  Item({
    required this.product,
    required this.quantity,
  });

  final Product product;
  final int quantity;

  double get price => product.price * quantity;

  @override
  String toString() => '$quantity x ${product.name}: \$$price';
}
