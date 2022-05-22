import 'dart:math';

void main() {
  var sq = Sqaure(length: 6);
  print(sq.area);
  printArea(sq);
  print('------');
  var circle = Circle(radius: 6);
  print(circle.area);
  printArea(circle);
}

abstract class Shape {
  double get area;
}

class Sqaure extends Shape {
  Sqaure({
    required this.length,
  });
  double length;

  @override
  double get area => length * length;
}

class Circle extends Shape {
  Circle({
    required this.radius,
  });
  double radius;

  @override
  double get area => pi * radius * radius;
}

void printArea(Shape shape) {
  print(shape.area);
}
