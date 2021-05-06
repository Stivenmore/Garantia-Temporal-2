import 'package:flutter/material.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateInitial.dart';

class StateViewSnack extends StatefulWidget {
  final String snackview;
  StateViewSnack({Key key, this.snackview}) : super(key: key);

  @override
  _StateViewSnackState createState() => _StateViewSnackState();
}

class _StateViewSnackState extends State<StateViewSnack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Details Users'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StateInitial()));
            },
          ),
        ),
      body: Center(
        child: Text('No hay usuarios registrados'),
      ),
    );
  }
}
