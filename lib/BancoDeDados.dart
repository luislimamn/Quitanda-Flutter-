import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDeDados extends StatefulWidget {
  const BancoDeDados({super.key});

  @override
  State<BancoDeDados> createState() => _BancoDeDadosState();
}

class _BancoDeDadosState extends State<BancoDeDados> {

  _recuperarBancoDeDados() async {
    final caminhoBancoDeDados = await getDatabasesPath();
    final localBancoDeDados = join(caminhoBancoDeDados, "banco.db");
    var bd = await openDatabase(
      localBancoDeDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE  usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      }
    );
    //print("Aberto: ${retornoDB.isOpen.toString()}");
    return bd;
  }

  _salvarBancoDeDados() async {
    Database bd = await _recuperarBancoDeDados();
    Map<String, dynamic> dadosUsuarios = {
      "nome" : "João Nogueira",
      "idade" : 71
    };
    int id = await bd.insert("usuarios", dadosUsuarios);
    if (kDebugMode) {
      print("Salvo: $id");
    }
  }
  _listarUsuarios() async {
    Database bd = await _recuperarBancoDeDados();
    String sql = "SELECT * FROM usuarios ";
    //String sql = "SELECT * FROM usuarios WHERE nome = 'João Nogueira'";
    //String sql = "SELECT * FROM usuarios WHERE nome LIKE 'João%'";
    //String sql = "SELECT * FROM usuarios WHERE 1=1 ORDER BY UPPER(nome) ASC";
    //String sql = "SELECT * FROM usuarios WHERE idade = 35";
    //String sql = "SELECT * FROM usuarios WHERE idade = 35 OR idade = 71";
    //String sql = "SELECT * FROM usuarios WHERE idade IN (35,71)";
    //String sql = "SELECT * FROM usuarios WHERE idade >= 35 AND idade <= 71";
    //String sql = "SELECT * FROM usuarios WHERE idade BETWEEN 35 AND 71";
    List usuarios = await bd.rawQuery(sql);
    if (kDebugMode) {
      for(var usuario in usuarios){
        print("id: ${usuario['id'].toString()}");
        print("Nome: ${usuario['nome']}");
        print("Idade: ${usuario['idade'].toString()}");
        print("______________________________");
      }
    }
  }

  _listarUsuarioPeloId(int id) async {
    Database bd = await _recuperarBancoDeDados();
    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ?",
      whereArgs: [id]
    );

    if (kDebugMode) {
      for(var usuario in usuarios){
        print("id: ${usuario['id'].toString()}");
        print("Nome: ${usuario['nome']}");
        print("Idade: ${usuario['idade'].toString()}");
        print("______________________________");
      }
    }
  }

  _ecluirUsuario(int id) async {
    Database bd = await _recuperarBancoDeDados();
    bd.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id]
    );
  }

  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDeDados();
    Map<String, dynamic> dadosUsuarios = {
      "nome" : "Luis Lima",
      "idade" : 38
    };
    bd.update(
      "usuarios",
      dadosUsuarios,
      where: "id = ?",
      whereArgs: [id]
    );
  }

  @override
  Widget build(BuildContext context) {
    //_recuperarBancoDeDados();
    //_salvarBancoDeDados();
    _listarUsuarioPeloId(1);
    //_ecluirUsuario(3);
    _atualizarUsuario(1);
    _listarUsuarios();
    return Container();
  }
}
