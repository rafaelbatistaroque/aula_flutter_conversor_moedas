import 'package:flutter/material.dart';
import 'package:aula_flutter_conversor_moedas/pages/home.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      hintColor: Colors.amber,
      primaryColor: Colors.white
    ),
  ));
}
