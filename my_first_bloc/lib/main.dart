import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_bloc/bloc/pizza_bloc.dart';

import 'models/pizza_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PizzaBloc()..add(LoadPizzaCounter()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(random: random),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.random,
  });

  final Random random;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza bloc tutorial'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator();
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${state.pizzas.length}",
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int i = 0; i < state.pizzas.length; i++)
                          Positioned(
                              left: random.nextInt(250).toDouble(),
                              top: random.nextInt(400).toDouble(),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: state.pizzas[i].image,
                              ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.local_pizza_outlined),
              onPressed: () {
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
              }),
          FloatingActionButton(
              child: const Icon(Icons.minimize),
              onPressed: () {
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
              }),
          FloatingActionButton(
              child: const Icon(Icons.local_pizza_outlined),
              onPressed: () {
                context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
              }),
          FloatingActionButton(
              child: const Icon(Icons.minimize),
              onPressed: () {
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
              }),
        ],
      ),
    );
  }
}
