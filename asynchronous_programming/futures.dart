void main() async {
  print('program started');
//   fetchUserOrder()
//       .then((value) => print('User order is $value'))
//       .catchError((e) => print(e.toString()));
  var order = await fetchUserOrder();
  print('User order is $order');
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 3), () => 'chicken');
}
