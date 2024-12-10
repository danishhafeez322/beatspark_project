import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget gotoPage;
  SplashPage({super.key, required this.gotoPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => gotoPage));
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Splash.png"), fit: BoxFit.cover)),
        // color: Colors.white,
        alignment: Alignment.center,
        child: Image.asset(
          "assets/Frame.png",
          height: 160,
          width: 170,
        ),
      ),
    );
  }
}
