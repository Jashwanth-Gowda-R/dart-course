import 'dart:math';

void main() {
  var sq = Sqaure(length: 6);
  // print(sq.area);
  // printArea(sq);
  sq.printValue();
  print('------');
  var circle = Circle(radius: 6);
  // print(circle.area);
  // printArea(circle);
  circle.printValue();
}

abstract class Shape {
  double get area;
  double get perimeter;

  void printValue() {
    print('area : $area, perimeter: $perimeter');
  }
}

class Sqaure extends Shape {
  Sqaure({
    required this.length,
  });
  double length;

  @override
  double get area => length * length;

  @override
  double get perimeter => 4 * length;
}

class Circle extends Shape {
  Circle({
    required this.radius,
  });
  double radius;

  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;
}

// void printArea(Shape shape) {
//   print(shape.area);
//   print(shape.perimeter);
// }
