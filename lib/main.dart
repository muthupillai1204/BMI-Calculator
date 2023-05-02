// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use, unnecessary_string_interpolations

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalc(),
    );
  }
}

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  int currentindex = 0;
  // String? result = null;
  String result = "";
  double height = 0;
  double weight = 0;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 159, 113, 197),
          // ignore: prefer_const_constructors
          title: Text(
            "BMI Calculator",
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          elevation: 0.0,
          // backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.blueGrey,
                )),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Color.fromARGB(255, 235, 185, 91), 0),
                  radioButton("Women", Color.fromARGB(255, 216, 133, 233), 1),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Height in Cm : ",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 122, 81, 236)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: TextFormField(
                  controller: heightController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please Enter your Height ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none),
                  ),
                  // validator: (value) {
                  //   //validation for height
                  //   if (value!.isEmpty) {
                  //     return "Height cannot be empty";
                  //   }

                  //   return null;
                  // },
                  // onChanged: (value) {
                  //   height = value
                  //       as double; //if any changes in textfield it will get callback
                  //   setState(() {
                  //     //creating method for rebuild(recall the build method) and statechange it only works in statefullwidget not stateless
                  //   });
                  // },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Weight in kg : ",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 122, 81, 236)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: TextFormField(
                  controller: weightController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Please Enter your Weight ",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide.none),
                  ),
                  // validator: (value) {
                  //   //validation for weight
                  //   if (value!.isEmpty) {
                  //     return "weight cannot be empty";
                  //   }

                  //   return null;
                  // },
                  // onChanged: (value) {
                  //   weight = value
                  //       as double; //if any changes in textfield it will get callback
                  //   setState(() {
                  //     //creating method for rebuild(recall the build method) and statechange it only works in statefullwidget not stateless
                  //   });
                  // },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              //add buttons
              Center(
                child: Container(
                  width: 250,
                  height: 60.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29.0)),
                    minWidth: 250,
                    onPressed: () {
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);
                      });

                      calculateBmi(height, weight);
                    },
                    color: Color.fromARGB(255, 214, 119, 140),
                    padding: EdgeInsets.all(15.0),
                    splashColor: Colors.orange,
                    child: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  child: Text(
                    "Your BMI is : ",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 25.0,
              ),
              Center(
                child: Container(
                  child: Text(
                    "$result",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: FlatButton(
        color:
            currentindex == index ? color : Color.fromARGB(255, 187, 199, 204),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
