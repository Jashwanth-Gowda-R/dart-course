void main(List<String> arguments) {
  if (arguments.length < 1) {
    print('Syntax: dart lib/main.dart <city name>');
  }
  final city = arguments.first;
  print(city);
}
