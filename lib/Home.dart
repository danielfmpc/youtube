import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("Acao: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
              
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("Acao: conta");
            },
          ),
        ],
      ),
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.green,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          ),          
        ],
      ),
    );
  }
}