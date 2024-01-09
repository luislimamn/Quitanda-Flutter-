import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final String _titulo = "Dismissible Widget";
  List _lista = ["Messi", "Cristiano Ronaldo", "Neymar", "Endrick"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.blue, //Cor de Fundo do Titulo
        foregroundColor: Colors.lightGreenAccent, //Cor do Texto do Titulo
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (context, index){
                final item = _lista[index];
                return Dismissible(
                  background: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.all(20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction){
                    if(direction == DismissDirection.startToEnd){
                      print("Direção: StartToEnd");
                    }else if(direction == DismissDirection.endToStart){
                      print("Direção: EndToStart");
                      setState(() {
                        _lista.removeAt(index);
                      });
                    }
                  },
                  key: Key(item),
                  child: ListTile(
                    title: Text(item),
                  )
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
