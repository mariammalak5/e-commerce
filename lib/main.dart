import 'package:ecommerce/pres/screens/login.dart';
import 'package:ecommerce/pres/screens/splash.dart';
import 'package:ecommerce/utils/images.dart';
import 'package:ecommerce/utils/names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ecoommerce());
}
class ecoommerce extends StatelessWidget {
  const ecoommerce({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashIm,
      routes: {splashIm: (context) => Splash(), loginSc: (context) => login()},
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.blueGrey, elevation: 0),),
    );
  }
}
