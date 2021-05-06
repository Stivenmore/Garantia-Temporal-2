import 'package:flutter/material.dart';
import 'package:flutter_y_sqflite/ui/pages/splash/SplashScreen.dart';

class StateError extends StatefulWidget {
  StateError({Key key}) : super(key: key);

  @override
  _StateErrorState createState() => _StateErrorState();
}

class _StateErrorState extends State<StateError> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff3C4083),
                      Color(0xff3C4083),
                      Colors.white
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [
                      0.2,
                      0.35,
                      0.6,
                    ])),
            child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  'assets/image/estrellas.png',
                  height: size.height * 0.6,
                  width: size.width,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned(
              bottom: size.height * 0.6,
              right: size.width * 0.33,
              child: Image.asset('assets/image/planeta.png')),
          Positioned(
              bottom: size.height * 0.62,
              right: size.width * 0.17,
              child: Image.asset('assets/image/aros.png')),
          Positioned(
              right: size.width * 0.20,
              bottom: size.height * 0.65,
              child: Image.asset('assets/image/astronaut.png')),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width,
              height: 300,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'No signal!',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3C4083)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We’re having some difficulities. Please try again.',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3C4083)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context)=> SplashScreen()), (route) => false);
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 90,
                      width: size.width,
                      decoration: BoxDecoration(color: Color(0xff3C4083)),
                      child: Center(
                        child: Text(
                          'Refresh',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}