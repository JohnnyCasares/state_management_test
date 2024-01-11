import 'package:flutter/cupertino.dart';
import 'package:pizza_provider/models/pizza_model.dart';

class PizzaProvider extends ChangeNotifier{
  List<Pizza> pizzas = [];

  PizzaProvider();

  void addPizza({required Pizza pizza}) async{
    pizzas.add(pizza);
    notifyListeners();
  }
  void removePizza({required Pizza pizza}) async{
    pizzas.remove(pizza);
    notifyListeners();
  }


}