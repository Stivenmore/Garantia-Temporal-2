import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_y_sqflite/domain/cubit/firebase_cubit.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateInitial.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateError.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateSnapbar.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FirebaseCubit, FirebaseState>(builder: (context, state) {
      switch (state.runtimeType) {
        case FirebaseInitial:
          return StateInitial();
          break;
        case FirebaseError:
          return StateError();
          break;
        case FirebaseSnapbar:
          return BlocBuilder<FirebaseCubit, FirebaseState>(
            builder: (context, state) => (state is FirebaseSnapbar)
            ? StateSnapbar(snapbartext: state.snapbar,)
            : null
          );
        default:
          return Scaffold(body: Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)));
      }
    });
  }
}
