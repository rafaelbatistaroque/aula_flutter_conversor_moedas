import 'package:flutter/material.dart';
import 'package:aula_flutter_conversor_moedas/utils/fnc.request.dart';
import 'package:aula_flutter_conversor_moedas/utils/fnc.builders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Control values inputBox's
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar, euro;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //Top bar
      appBar: buildAppBar("Conversor de moedas", _clearFields),
      //Body App
      body: FutureBuilder<Map>(  
        future: getData(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return buildMsgUser("Sem conexão. Tente mais tarde.");
            case ConnectionState.waiting:
              return buildMsgUser("Carregando dados...");
            default:
              if(snapshot.hasError){
                return buildMsgUser("Erro ao carregar...");
              }
              else{
                dolar = snapshot.data["USD"]["buy"];
                euro = snapshot.data["EUR"]["buy"];
                                
                return SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.monetization_on,size: 120.0, color: Colors.amber),
                      SizedBox(height: 10),
                      buildTextField("Reais", "R\$", realController, _realToExchanger),
                      SizedBox(height: 10),
                      buildTextField("Dólares", "U\$", dolarController, _dolarToExchanger),
                      SizedBox(height: 10),
                      buildTextField("Euros", "€", euroController, _euroToExchanger)
                    ],
                  ),
                );
              }
          }
        }),
    );
  }
  void _clearFields(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
  }

  void _realToExchanger(String text){
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }
  void _dolarToExchanger(String text){
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }
  void _euroToExchanger(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }
}
