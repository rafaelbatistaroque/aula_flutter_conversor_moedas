import 'package:flutter/material.dart';

Widget builderTextField(String prefix, String cifrao){
  return TextField(
          decoration: InputDecoration(
            labelText: prefix,
            labelStyle: TextStyle(color: Colors.amber),
            border: OutlineInputBorder(),
            prefixText: cifrao,
          ),
        );
}