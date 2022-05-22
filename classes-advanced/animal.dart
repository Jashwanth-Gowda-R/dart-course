void main() {
  var animal = Animal(age: 6);
  animal.sleep();
  print('-------');
  var dog = Dog(age: 6);
  dog.bark();
  dog.sleep();
}

class Animal {
  Animal({
    required this.age,
  });
  final int age;

  void sleep() => print('sleeping');
}

class Dog extends Animal {
  Dog({required int age}) : super(age: age);

  void bark() => print('Barking');

  @override
  void sleep() {
    super.sleep();
    print('dog needs more sleep');
  }
}

class Cow extends Animal {
  Cow({required int age}) : super(age: age);

  void mow() => print('mow mow');
}
