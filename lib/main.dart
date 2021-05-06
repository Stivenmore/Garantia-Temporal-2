import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_y_sqflite/domain/cubit/firebase_cubit.dart';
import 'package:flutter_y_sqflite/ui/pages/splash/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter and SQFlite',
          theme: ThemeData(
            accentColor: Colors.white,
            primaryColor: Color(0xffE04536),
            primarySwatch: Colors.red,
          ),
          home: SplashScreen()),
    );
  }
}
