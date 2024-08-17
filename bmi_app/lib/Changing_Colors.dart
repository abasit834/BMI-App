import 'dart:async';

import 'package:flutter/material.dart';

class ColorChange extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ColorChanged();


}

class ColorChanged extends State<ColorChange>
{
  var index = 0;
  late Timer _timer; // Timer instance to change colors periodically

  void initState() {
    super.initState();
    _startTimer(); // Start the periodic timer
  }

  void _startTimer() {
    // Create a periodic timer that changes color every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        index = (index + 1) % colors.length; // Cycle through colors
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  List<Color>colors =[Colors.red,Colors.green];
  List<Color>colors1 =[Colors.green,Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Container(
            color : colors1[index],
            child: Center(child: Text("Under Construction",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: colors[index]))))
    );

  }



}