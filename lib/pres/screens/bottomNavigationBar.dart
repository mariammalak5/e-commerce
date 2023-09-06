import 'package:ecommerce/pres/screens/home.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class BottonN extends StatefulWidget {
  const BottonN({Key? key}) : super(key: key);

  @override
  State<BottonN> createState() => _BottonNState();
}

class _BottonNState extends State<BottonN> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom:  TabBar(
            tabs: [
              Tab(text: "products",icon:Icon( Icons.production_quantity_limits_outlined)),
              Tab(text: "categories",icon:Icon( Icons.category_rounded)),
            ],
          ),title: Center(child: Text("Home")),
        ),
        body: TabBarView(
          children: [
            Home(),
            Categories(),
          ],
        ),
      ),
    );
  }
}
