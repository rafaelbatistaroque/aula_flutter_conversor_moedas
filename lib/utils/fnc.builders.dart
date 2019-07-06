import 'package:flutter/material.dart';

//Top Bar
Widget buildAppBar(String titleBar){
  return AppBar(
          title: Text(titleBar),
          backgroundColor: Colors.amber,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete_forever, size: 30,),
              onPressed: (){},
            )
          ],
        );
}
//Message loading system
Widget buildMsgUser(String msgUser){
  return Center(
          child: Text(msgUser,
            style: TextStyle(color: Colors.amber, fontSize: 20),
            textAlign: TextAlign.center)
        );
}
//Structure InputBox's
Widget buildTextField(String currency, String cifrao, TextEditingController crtl, Function fnc){
  return TextField(
          controller: crtl,
          decoration: InputDecoration(
            labelText: currency,
            labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
            border: OutlineInputBorder(),
            prefixText: cifrao),
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.amber),
          onChanged: fnc
        );
}