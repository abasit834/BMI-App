import 'package:BMI/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomePage();

}
class HomePage extends State<Home> {
  var gender='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xfff6d365),Color(0xfffda085)])
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Choose Your Gender",
                style: TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 60), // Add spacing between text and containers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                     gender='M';
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BMI(gender : gender.toString())));   // Handle button press
                  },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 11,
                            spreadRadius: 5,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.male,
                        size: 100,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      gender='F';
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BMI(gender : gender.toString()))); // Handle button press
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade400,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 11,
                            spreadRadius: 5,
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.female,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height : 15),
              Row(
                children: [
                  const SizedBox(width : 93),
                  Text("Male",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  const SizedBox(width : 143),
                  Text("Female",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
