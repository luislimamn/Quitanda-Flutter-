import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {

  var _titulo = "Floating Action Button";
  void _floatingButton(){
    print('Resultado: Botão Precionado');
  }
  void _menuBar(){
    print('Resultado: Menu Precionado');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.lightGreenAccent,
      ),
      body: Text("Conteudo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _floatingButton,
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 10,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        //shape: CircleBorder(),
        /*
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        */
      ),
      /*
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.lightGreenAccent,
        elevation: 13,
        //mini: true,
        child: Icon(Icons.add),
        onPressed: _floatingButton
      ),
      */
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: _menuBar,
              icon: Icon(Icons.menu),
            )
          ],
        ),
      ),
    );
  }
}
