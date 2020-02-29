import 'package:flutter/material.dart';
import 'package:flutter_mine/components/appbar/appbar.dart';
import 'package:flutter_mine/components/tabuleiro_widget.dart';
import 'package:flutter_mine/models/tabuleiro.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatefulWidget {
  int qtdeColunas;
  int qtdeBombas;

  CampoMinadoApp(List<int>data){
    this.qtdeColunas = data[0];
    this.qtdeBombas = data[1];
  }

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState(qtdeColunas, qtdeBombas);
}
class _CampoMinadoAppState extends State<CampoMinadoApp>{
  final int qtdeColunas;
  final int qtdeBombas;

  bool _venceu;
  Tabuleiro _tabuleiro;

  _CampoMinadoAppState(this.qtdeColunas, this.qtdeBombas);

  _reiniciar(){
    setState(() {
      _venceu = null;
      _tabuleiro.reiniciar();
      print('reiniciando...');
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura){
    if(_tabuleiro == null){

      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();

      _tabuleiro = Tabuleiro (
        linhas: qtdeLinhas,
        colunas: qtdeColunas,
        qtdeBombas: qtdeBombas,
      );
    }
    return _tabuleiro;
  }

  void _goBack(){
    Navigator.pop(context);
    print('back');
  }



  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MyAppBar(
            won: _venceu,
            onReiniciar: _reiniciar,
            goBack: _goBack,

        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return TabuleiroWidget(
                tabuleiro: _getTabuleiro(
                    constraints.maxWidth,
                    constraints.maxHeight,
                ),
                onAbrir: _abrir,
                onAlternarMarcacao: _alternarMarcacao,
              );
            },
          ),
        ),
      )
    );
  }

  void _alternarMarcacao(Campo campo ) {
    if(_venceu != null){
      return;
    }
    setState(() {
      campo.alternarMarcacao();
      if(_tabuleiro.resolvido){
        _venceu = true;
      }
    });
  }

  void _abrir(Campo campo) {
    if(_venceu != null){
      return;
    }
    setState((){

      try{
        campo.abrir();
        int l = campo.linha;
        int c = campo.coluna;

        if(_tabuleiro.resolvido){
          _venceu = true;
        }
      } on ExplosaoException{
          _venceu = false;
          _tabuleiro.revelarBombas();
      }
    });
  }


}