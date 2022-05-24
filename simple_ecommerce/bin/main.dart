import 'dart:io';

import 'package:test/cartClass.dart';
import 'package:test/productClass.dart';

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
  var cart = Cart();
  while (true) {
    stdout
        .write('What do you want to do? (v)iew cart/(a)dd items/(c)heckout? ');
    var input = stdin.readLineSync();
    print(input);
    if (input == 'a') {
      var product = chooseProduct();
      if (product != null) {
        // print(product.displayName);
        cart.addProduct(product);
        print(cart);
      }
    } else if (input == 'v') {
      print(cart);
    } else if (input == 'c') {
      if (checkout(cart)) {
        break;
      }
    }
  }
}

Product? chooseProduct() {
  var products = allProducts.map((item) => item.displayName).join('\n');
  stdout.write('Available products: \n$products\nYour Choice  ');
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

bool checkout(Cart cart) {
  if (cart.isEmpty) {
    print('Cart is empty');
    return false;
  }
  final total = cart.total();
  print('Total: \$$total');
  stdout.write('Payment in cash: ');
  final line = stdin.readLineSync();
  if (line == null || line.isEmpty) {
    return false;
  }
  final paid = double.tryParse(line);
  if (paid == null) {
    return false;
  }
  if (paid >= total) {
    final change = paid - total;
    print('Change: \$${change.toStringAsFixed(2)}');
    return true;
  } else {
    print('Not enough cash.');
    return false;
  }
}
