import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mine/components/mode_button.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {

  @override
  _Home createState() => _Home();

}

class _Home extends State<Home>{

  bool show_config = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
            Container(
              color: Colors.grey,
              child: Column(

                children: <Widget>[
                  get_appbar(context),

                  get_menu(context),
                ],
              ),
            ),
      ),
    );
  }


  Widget get_appbar(BuildContext context) {
    double spin = 0.75;
      return Container(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: TweenAnimationBuilder(
                        duration: Duration(seconds: 1),
                        tween: show_config ? Tween<double>(begin: 0, end: spin * math.pi)
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
                                  show_config = !show_config;
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

  Widget get_menu(BuildContext context){
    return show_config ?  Container(
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Config',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
              ),
            ),
            ModeButton(context, "Easy", [8, 15]),
          ],
        ),
      ),
    ) : Container(
      color: Colors.grey,
      padding: EdgeInsets.fromLTRB(0, 96, 0, 0),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
