import 'dart:math';
import 'package:pizza_provider/providers/pizza_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'models/pizza_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PizzaProvider())],
      child: MaterialApp(
        title: 'Pizza Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Pizza Provider"),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              for (int i = 0;
                  i < context.watch<PizzaProvider>().pizzas.length;
                  i++)
                Positioned(
                    left: random.nextInt(250).toDouble(),
                    top: random.nextInt(400).toDouble(),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: context.watch<PizzaProvider>().pizzas[i].image,
                    ))
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: const Icon(Icons.local_pizza_outlined),
                onPressed: () {
                  context
                      .read<PizzaProvider>()
                      .addPizza(pizza: Pizza.pizzas[0]);
                }),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
                child: const Icon(Icons.minimize),
                onPressed: () {
                  context
                      .read<PizzaProvider>()
                      .removePizza(pizza: Pizza.pizzas[0]);
                }),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
                child: const Icon(Icons.local_pizza_outlined),
                onPressed: () {
                  context
                      .read<PizzaProvider>()
                      .addPizza(pizza: Pizza.pizzas[1]);
                }),
            const SizedBox(
              height: 8,
            ),
            FloatingActionButton(
                child: const Icon(Icons.minimize),
                onPressed: () {
                  context
                      .read<PizzaProvider>()
                      .removePizza(pizza: Pizza.pizzas[1]);
                }),
          ],
        ));
  }
}
