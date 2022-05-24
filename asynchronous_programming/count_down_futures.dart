void main() async {
  await countDown(5);
  print('done');
}

Future<void> countDown(int n) async {
  for (var i = n; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1), () => print(i));
  }
}
