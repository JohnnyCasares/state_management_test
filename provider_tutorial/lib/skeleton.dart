import 'package:flutter/material.dart';
import 'package:provider_tutorial/pages/home_page.dart';
import 'package:provider_tutorial/pages/settings_page.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int tab = 0;
  List<Widget> body = [Home(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider App Tutorial'),
      ),
      body: body[tab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tab,
          onTap: updatePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }

  void updatePage(index) {

          setState(() {
            tab = index;
          });
        }
}
