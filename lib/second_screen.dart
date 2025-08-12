import 'package:flutter/material.dart';

import 'constant.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.bmiResult});

  final int bmiResult;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiResult;
    if (bmi<18){
      setState(() {
        bmiColor = Colors.white;
        bmiText = 'Underweight';
        imagepath = 'underweight';
      });
    }
   else if (bmi>=18 && bmi<=25){
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
        imagepath = 'normal';
      });
    }

    else if (bmi > 26 && bmi<=30){
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'Overweight';
        imagepath = 'overweight';
      });
    }

    else if (bmi > 31 && bmi<=35){
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'Obese';
        imagepath = 'obese';
      });
    }

    else if (bmi >= 36){
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'ExtremeObese';
        imagepath = 'extreme';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var  width = MediaQuery.of(context).size.width;
    var  height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: darkBlueColour,
      appBar: AppBar(
        backgroundColor: darkBlueColour,
      ),

      body:
      Column(
        children: [
          Container(
            width: width,
            height: 190,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(" Your BMI value is", style:  textStyle.copyWith(fontSize: 24)),
                Text('${widget.bmiResult}', style: numtextStyle.copyWith(fontSize: 28)),
                Text('${bmiText}', style:  textStyle.copyWith(color: bmiColor)),
              ],
            ) ,
          ),

          Image.asset('images/${imagepath}.png', height: height * 0.5,),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text("Calculate Again", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}
