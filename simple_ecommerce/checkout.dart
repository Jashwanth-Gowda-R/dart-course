import 'dart:io';

const allProducts = [
  Product(id: 1, name: 'apples', price: 1.60),
  Product(id: 2, name: 'bananas', price: 0.70),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.00),
  Product(id: 5, name: 'mushrooms', price: 0.80),
  Product(id: 6, name: 'potatoes', price: 1.50),
];

// loop
//   prompt: view cart / add item / checkout
//   if selection == add item
//     choose a product
//     add it to the cart
//     print cart
//   else if selection == view cart
//     print cart
//   else if selection == checkout
//     do checkout
//     exit
//   end
void main() {
  while (true) {
    stdout
        .write('What do you want to do? (v)iew cart/(a)dd items/(c)heckout? ');
    var input = stdin.readLineSync();
    print(input);
    if (input == 'a') {
      var product = chooseProduct();
      if (product != null) {
        print(product.displayName);
      }
    } else if (input == 'v') {
    } else if (input == 'c') {
      exit(1);
    }
  }
}

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;

  String get displayName => '($initial)${name.substring(1)} : \$$price';
  String get initial => name.substring(0, 1);
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

Product? chooseProduct() {
  var products = allProducts.map((item) => item.displayName).join('\n');
  stdout.write('Available products: \n$products\nYour Choice');
  var input = stdin.readLineSync();
  print(input);
  for (var product in allProducts) {
    if (product.initial == input) {
      return product;
    }
  }
  print('Not found');
  return null;
}
