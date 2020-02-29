import 'package:flutter/material.dart';
import 'package:flutter_mine/models/campo.dart';
import 'package:flutter_mine/models/tabuleiro.dart';

import 'campo_widget.dart';

class TabuleiroWidget extends StatelessWidget{

  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  const TabuleiroWidget({
    @required this.tabuleiro,
    @required this.onAbrir,
    @required this.onAlternarMarcacao
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map((c){
          return CampoWidget(
            campo: c,
            onAbrir: onAbrir,
            onAlternarMarcacao: onAlternarMarcacao,
          );
        }).toList(),
      ),
    );
  }

}