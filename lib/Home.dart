import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _textoSalvo = "Nada Salvo!";
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() async {
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Nada Salvo!";
    });
  }
  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
    _textoSalvo = "Nada Salvo!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de Dados"),
        backgroundColor: Colors.blue, //Cor de Fundo do Titulo
        foregroundColor: Colors.lightGreenAccent, //Cor do Texto do Titulo
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite ALgo"
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  ),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightGreenAccent
                    ),
                  ),
                  //color: Colors.orange,
                  //padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: _salvar,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
                  ),
                  child: const Text(
                    "Remover",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightGreenAccent
                    ),
                  ),
                  //color: Colors.orange,
                  //padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
