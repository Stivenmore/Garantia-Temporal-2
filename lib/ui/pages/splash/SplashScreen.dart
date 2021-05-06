import 'package:flutter/material.dart';
import 'package:flutter_y_sqflite/ui/pages/register/RegisterScreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
   void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                   LottieBuilder.asset(
                  'assets/animation/lottie.json',
                  height: 200,
                  width: 200,
                ),
              SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(
                backgroundColor: Color(0xffE04536),
              )
            ],
          ),
        ));
  }
}
