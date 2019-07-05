import 'package:flutter/material.dart';
import 'package:aula_flutter_conversor_moedas/utils/fnc.request.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Conversor de moedas"),
        backgroundColor: Colors.amber,
        centerTitle: true),

      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: Text("Carregando dados...",
                    style: TextStyle(color: Colors.amber,fontSize: 20),
                    textAlign: TextAlign.center)
              );
            default:
              if(snapshot.hasError){
                return Center(
                  child: Text("Erro ao carregar...",
                    style: TextStyle(color: Colors.amber,fontSize: 20),
                  textAlign: TextAlign.center),
                );
              }else{
                return Container(color: Colors.green);
              }
          }
        })
    );
  }
}
