
import 'package:flutter/material.dart';


class ResultScreen extends StatefulWidget{
  final String result,bmi,name,gender;

  const ResultScreen({super.key ,required this.result, required this.bmi,required this.name,required this.gender});

  @override
  State<StatefulWidget> createState() => Report();

}

class Report extends State<ResultScreen>
{

  Color gMColor1=const Color(0xff30cfd0);
  Color gMcolor2=const Color(0xff330867);

  AssetImage image=AssetImage('assets/images/maleAvatar.png');

  @override
  void initState()
  {
    super.initState();
    setState(() {

    });
    if (widget.gender == 'F') {
      gMColor1= const Color(0xffc71d6f);
      gMcolor2= const Color(0xffd09693);
      image= AssetImage('assets/images/femaleAvatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [gMColor1, gMcolor2],)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 275,
                    height: 375,
                    decoration: BoxDecoration(
                        color: gMColor1,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: const [
                          BoxShadow(blurRadius: 11,
                              spreadRadius: 5,
                              color: Colors.black26)
                        ]
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           CircleAvatar(
                              radius: 75,
                              backgroundColor: Colors.transparent,
                              // Set the background color to transparent
                              child: ClipOval(
                                child: Image(
                                  image: image,
                                  width: 300,
                                  // Increase this value to make the image larger
                                  height: 300,
                                  // Increase this value to make the image larger
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                          Text("Name : ${widget.name}", style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                          Text("BMI : ${widget.bmi}", style: const TextStyle(
                              fontSize: 15, color: Colors.white)),
                          Text("Result : ${widget.result}", style: const TextStyle(
                              fontSize: 15, color: Colors.white)),

                        ]
                    ),
                  ),
                ),
              ],
            ),
          )
      );



  }


}