import 'package:flutter/material.dart';
import 'package:quitanda/BancoDeDados.dart';
import 'package:quitanda/InoovaMusic.dart';
import 'package:quitanda/Lista.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  final String _titulo = "Inoova App Bar";
  TabController? _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.blue, //Cor de Fundo do Titulo
        foregroundColor: Colors.lightGreenAccent, //Cor do Texto do Titulo
        bottom: TabBar(
          labelColor: Colors.lightGreenAccent,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.lightGreenAccent,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Inicio",
              icon: Icon(Icons.home),
            ),
            Tab(
              text: "Music",
              icon: Icon(Icons.library_music),
            ),
            Tab(
              text: "Lista",
              icon: Icon(Icons.list_alt),
            )
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          BancoDeDados(),
          InoovaMusic(),
          Lista()
        ],
      ),
    );
  }
}
