import 'package:flutter/material.dart';

class Pizza {
  final String id;
  final String name;
  final Image image;

  const Pizza({required this.id, required this.name, required this.image});

  static List<Pizza> pizzas = [
    Pizza(id: '0', name: 'Pizza', image: Image.asset('images/margherita.png')),
    Pizza(
        id: '1',
        name: 'Pizza Pepperoni',
        image: Image.asset("images/peperoni.png"))
  ];
}
