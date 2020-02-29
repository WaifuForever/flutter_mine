import 'package:flutter/material.dart';
import 'package:flutter_mine/components/appbar/stopwatch.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {

  final Function goBack;
  final Function onReiniciar;
  final bool won;

  MyAppBar({
    @required this.won,
    @required this.onReiniciar,
    @required this.goBack,
  });

  @override
  State<StatefulWidget> createState() => _MyAppBar();

  @override
  Size get preferredSize => Size.fromHeight(120);
}

class _MyAppBar extends State<MyAppBar>{

  Color _getCor(){
    if(widget.won == null){
      return Colors.yellow;
    } else if(widget.won){
      return Colors.green[300];
    } else{
      return Colors.red[300];
    }
  }

  IconData _getIcon(){
    if(widget.won == null){
      return Icons.sentiment_satisfied;
    } else if(widget.won){
      print('voce venceu...');
      return Icons.sentiment_very_satisfied;
    } else{
      print('voce perdeu...');
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Row(
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      tooltip: 'Return to menu',
                      onPressed: () => widget.goBack(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        constraints.maxWidth / 3,
                        10,
                        constraints.maxWidth / 6.2,
                        10),
                    child: CircleAvatar(
                      backgroundColor: _getCor(),
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          _getIcon(),
                          color: Colors.black,
                          size: 35,
                        ),
                        onPressed: widget.onReiniciar,
                      ),
                    ),
                  ),
                  MyStopWatch(won: widget.won,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
