import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mine/screens/campo_minado_app.dart';
import 'package:scoped_model/scoped_model.dart';

class MyStopWatch extends StatefulWidget {
  final bool won;

  const MyStopWatch({Key key, this.won}) : super(key: key);


  @override
  _MyStopWatch createState() => _MyStopWatch();
}

class _MyStopWatch extends State<MyStopWatch>{
  bool started = false;
  bool stopped = false;
  bool reset;


  String time = "00:00:00";

  final dur = const Duration(seconds: 1);
  var swatch = Stopwatch();



  void _setTime() {
    if (swatch.isRunning) {
      setState((){
        if (widget.won == null){
          time = swatch.elapsed.inHours.toString().padLeft(2, "0") + ":" +
              (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") + ":" +
              (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
          Timer(dur, _setTime);
        } else{
          swatch.stop();
          swatch.reset();
        }
      });
    }
  }



  void startsStopWatch() {
    stopped = false;
    started = true;
    swatch.start();
    Timer(dur, _setTime);
  }


  @override
  Widget build(BuildContext context) {
    startsStopWatch();
    // First, create a `ScopedModel` widget. This will provide
    // the `model` to the children that request it.
    return Container(
      child: IgnorePointer(
          ignoring: true,
          child: MaterialButton(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            onPressed: () => {},

            child: Text(
                time,
                style: TextStyle(
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .width * 0.065,
                  fontFamily: 'Calculator',
                  color: Color.fromRGBO(29, 193, 3, 100),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                )
            ),
          ),
      ),
    );
  }
}







