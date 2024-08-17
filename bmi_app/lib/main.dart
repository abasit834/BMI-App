import 'package:BMI/Result_Screen.dart';
import 'package:BMI/bmiSplashScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Commented out

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator's
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class BMI extends StatefulWidget {
  final String gender;
  const BMI({super.key, required this.gender});

  @override
  State<StatefulWidget> createState() => MCalculations();
}

class MCalculations extends State<BMI> {
  bool loading = false;
  final databaseRef= FirebaseDatabase.instance.ref('User Data'); // Commented out

  var name = TextEditingController();
  var HeightInFt = TextEditingController();
  var HeightInInches = TextEditingController();
  var weight = TextEditingController();
  var HeightInMetres = 0.0;
  var BM = 0.0;
  var Result = " ";
  Color color1 = Colors.blue;

  @override
  Widget build(BuildContext context) {
    if (widget.gender == 'F') {
      color1 = Colors.pink;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        elevation: 5.00,
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Colors.yellow.shade300,
        child: Center(
          child: SizedBox(
            width: 250,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "BMI",
                    style: TextStyle(
                        fontSize: 21, fontWeight: FontWeight.bold, color: color1),
                  ),
                ),
                TextField(
                  controller: name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'FullName',
                      prefixIcon: Icon(Icons.verified_user),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: color1,
                            width: 2,
                          ))),
                ),
                TextField(
                  controller: HeightInFt,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Height',
                      prefixIcon: const Icon(Icons.height),
                      suffixText: 'ft',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: color1,
                            width: 2,
                          ))),
                ),
                TextField(
                  controller: HeightInInches,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Height',
                      prefixIcon: const Icon(Icons.height),
                      suffixText: 'inches',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: color1,
                            width: 2,
                          ))),
                ),
                TextField(
                  controller: weight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Weight',
                      prefixIcon: const Icon(Icons.line_weight),
                      suffixText: 'kg',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: color1,
                            width: 2,
                          ))),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var hF = HeightInFt.text.toString();
                        var hI = HeightInInches.text.toString();
                        var w = weight.text.toString();

                        HeightInMetres = double.parse(hF) * 0.3048 +
                            double.parse(hI) * 0.0254;

                        databaseRef.child(name.text.toString()).set({
                          'Height in feet': hF,
                          'Height in metres' : hI,
                          'Weight' : w,
                        });

                        BM = double.parse(w) /
                            (HeightInMetres * HeightInMetres);

                        if (BM < 18.5) {
                          Result = "UnderWeight";
                        } else if (BM >= 18.5 && BM <= 24.5) {
                          Result = "Normal Weight";
                        } else if (BM >= 25.0 && BM <= 29.9) {
                          Result = "OverWeight";
                        } else {
                          Result = "Obese";
                        }
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                  result: Result,
                                  bmi: BM.toStringAsFixed(3),
                                  name: name.text.toString(),
                                  gender: widget.gender)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color1,
                      elevation: 8, // Change this to your desired color
                    ),
                    child: const Text("Calculate",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
