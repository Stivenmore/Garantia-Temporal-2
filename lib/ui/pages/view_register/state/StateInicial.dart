import 'package:flutter/material.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateInitial.dart';

class StateViewInitial extends StatefulWidget {
  StateViewInitial({Key key}) : super(key: key);

  @override
  _StateViewInitialState createState() => _StateViewInitialState();
}

class _StateViewInitialState extends State<StateViewInitial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed:()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StateInitial()))),
      ),
      body: Center(
        child:Text('No hay registros')
      ),
    );
  }
}
