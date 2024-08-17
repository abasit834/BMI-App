
import 'package:flutter/material.dart';

class FemaleBMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculations();

}



class Calculations extends State<FemaleBMI>
{
  var HeightInFt=TextEditingController();
  var HeightInInches=TextEditingController();
  var weight=TextEditingController();
  var HeightInMetres=0.0;
  var BM=0.0;
  var Result=" ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator",style : TextStyle(fontWeight: FontWeight.w600,color : Colors.black)),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 5.00,
          backgroundColor: Colors.yellow,
        ),
        body : Container(
          color : Colors.yellow.shade100,
          child: Center(
            child: Container(
              width : 250,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(child: Text("BMI",style : TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.pink) )),
                  TextField(
                    controller: HeightInFt,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Height',
                        prefixIcon: Icon(Icons.height),
                        suffixText: 'ft',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2,
                            )

                        )
                    ),
                  ),
                  TextField(
                    controller: HeightInInches,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Height',
                        prefixIcon: Icon(Icons.height),
                        suffixText: 'inches',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2,
                            )

                        )
                    ),
                  ),
                  TextField(
                    controller : weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Weight',
                        prefixIcon: Icon(Icons.line_weight),
                        suffixText: 'kg',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2,
                            )

                        )
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          var hF=HeightInFt.text.toString();
                          var hI=HeightInInches.text.toString();
                          var w=weight.text.toString();

                          HeightInMetres=double.parse(hF)* 0.3048+double.parse(hI)*0.0254;

                          BM=double.parse(w)/(HeightInMetres*HeightInMetres);

                          if(BM < 18.5)
                            Result="UnderWeight";
                          else if (BM >= 18.5 && BM <= 24.5)
                            Result="Normal Weight";
                          else if (BM >=25.0 && BM <=29.9)
                            Result="OverWeight";
                          else
                            Result="Obese";

                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        elevation: 8,// Change this to your desired color
                      ),
                      child: Text("Calculate",style: TextStyle(color : Colors.black,fontWeight: FontWeight.bold))),
                  SizedBox(height: 20,),
                  Text("BMI is : $BM  $Result"),

                ],
              ),
            ),
          ),
        )

    );
  }


}
