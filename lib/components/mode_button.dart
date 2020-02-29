import 'package:flutter/material.dart';
import 'package:flutter_mine/screens/campo_minado_app.dart';

class ModeButton extends StatelessWidget{
  final BuildContext mainContext;
  final String text;
  final List <int> data;

  ModeButton(this.mainContext, this.text, this.data);


  @override
  Widget build(BuildContext context) {
   return  Container(
     margin: const EdgeInsets.only(top: 20),
     child: MaterialButton(
       color: Colors.pink,
       minWidth: 200,
       height: 70,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.all(Radius.circular(20.0))),
       onPressed: () => {
         Navigator.push(
           mainContext,
           MaterialPageRoute(builder: (mainContext) => CampoMinadoApp(data)),
         )
       },
       child: Text(
         text,
         style: TextStyle(
           color: Colors.white,
           fontSize: 20,
         ),

       ),

     ),

   );

  }

}