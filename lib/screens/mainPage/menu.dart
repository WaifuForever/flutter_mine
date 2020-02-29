import 'package:flutter/material.dart';
import 'package:flutter_mine/components/mode_button.dart';
import 'dart:math' as math;

class Home extends StatefulWidget{

  @override
  _Home createState() => _Home();

}

class _Home extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _AppBar(),
        body: Container(
          color: Colors.grey,

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Select the game mode',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                ),
                ModeButton(context, "Easy", [8, 15]),
                ModeButton(context, "Moderate",[12, 30]),
                ModeButton(context, "Hard",[18, 50]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatefulWidget implements PreferredSizeWidget {

  @override
  State<StatefulWidget> createState() => _MyAppBar();

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _MyAppBar extends State<_AppBar>{
  AnimationController controller;
  bool expanded = false;
  double spin = 0.75;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Container(
                    child: TweenAnimationBuilder(
                      duration: Duration(seconds: 2),
                      tween: expanded ? Tween<double>(begin: 0, end: spin * math.pi)
                                      : Tween<double>(begin: 0, end: -spin * math.pi),
                      builder: (_, double angle, __){
                        return Transform.rotate(
                          angle: angle,
                          child: IconButton(
                            iconSize: 40,
                            icon: ImageIcon(
                              AssetImage("assets/images/icons/config.png"),
                              color: Color(0xFF3A5A98),
                            ),
                            onPressed: () {
                              setState(() {
                                expanded = !expanded;
                                print(expanded.toString() + ' $spin');
                              });
                            },
                          ),
                        );
                       },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

