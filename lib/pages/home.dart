import 'package:flutter/material.dart';
import 'package:aula_flutter_conversor_moedas/utils/fnc.request.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double dolar, euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      //Barra superior
      appBar: AppBar(
        title: Text("Conversor de moedas"),
        backgroundColor: Colors.amber,
        centerTitle: true),
      
      //Corpo do App
      body: FutureBuilder<Map>(  
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text("Carregando dados...",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
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
                // dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                // euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on,size: 120.0, color: Colors.amber),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Real",
                          labelStyle: TextStyle(fontSize: 16, color: Colors.amber),
                          border: OutlineInputBorder(),
                          prefixText: "R\$"
                        ),
                      )
                    ],
                  ),
                );
              }
          }
        }),
    );
  }
}
