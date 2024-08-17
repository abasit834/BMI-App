import 'dart:async';

import 'package:BMI/Home_Screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => BMISplashScreen();

}

class BMISplashScreen extends State<SplashScreen>
{
  void initState()
  {
    super.initState();

    Timer(const Duration (seconds: 2),(){
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context)=>Home()
      ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xfff6d365),Color(0xfffda085)])
        ),
        child: Center(
          child: SizedBox(
              width : 100,
              height : 100,
              child: Image.asset("assets/images/BMI.png"))
        ),
      ),

    );
  }




}