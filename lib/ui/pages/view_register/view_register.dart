import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_y_sqflite/domain/cubit/firebase_cubit.dart';
import 'package:flutter_y_sqflite/ui/pages/splash/SplashScreen.dart';
import 'package:flutter_y_sqflite/ui/pages/view_register/state/StateInicial.dart';
import 'package:flutter_y_sqflite/ui/pages/view_register/state/StateLoaded.dart';
import 'package:flutter_y_sqflite/ui/pages/view_register/state/StateSnack.dart';
import 'package:flutter_y_sqflite/ui/pages/register/state/StateError.dart';

class ViewRegister extends StatefulWidget {
  ViewRegister({Key key}) : super(key: key);

  @override
  _ViewRegisterState createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirebaseCubit, FirebaseState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case FirebaseLoaded:
              return BlocBuilder<FirebaseCubit, FirebaseState>(
                  builder: (context, state) => (state is FirebaseLoaded)
                      ? StateLoaded(
                          register: state.register,
                        )
                      : StateError());
              break;
            case FirebaseInitial:
              return BlocBuilder<FirebaseCubit, FirebaseState>(
                  builder: (context, state) =>
                      (state is FirebaseInitial) ? StateViewInitial() : StateError());
              break;
            case FirebaseSnapbar:
              return BlocBuilder<FirebaseCubit, FirebaseState>(
                  builder: (context, state) => (state is FirebaseSnapbar)
                      ? StateViewSnack(
                          snackview: state.snapbar,
                        )
                      : StateError());
              break;
            case FirebaseError:
              return StateError();
              break;
            default:
              return SplashScreen();
          }
        },
      ),
    );
  }
}
