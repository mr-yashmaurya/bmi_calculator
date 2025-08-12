import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightSlider = 120;
  int age = 30;
  int weight = 45;
 Color maleColour = Color(0xff033e66);
 Color femaleColour = Color(0xff033e66);

 void calculateBMI(){
   var heightInMetter = heightSlider/100;
   var bmi = weight / (heightInMetter * heightInMetter);
   print(bmi.round());
   Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen( bmiResult: bmi.round())));
 }

  void selectGender( bool gender){
    if ( gender ){
      setState(() {
        maleColour = blueColor;
        femaleColour = selectedColor;
      });
    }
    else {
     setState(() {
       maleColour = selectedColor;
       femaleColour = blueColor;
     });
    }
  }
  addSubAge( bool Ageadd){
   if(Ageadd){
     setState(() {
       age++;
     });
   }
   else{
     setState(() {
       age--;
     });
   }
}
  addSubWeight( bool Weightadd){
    if(Weightadd){
      setState(() {
        weight++;
      });
    }
    else{
      setState(() {
        weight--;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: darkBlueColour,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                       setState(() {
                         selectGender(true);
                       });
                      },
                      child: ReusableCard(
                        Colour: maleColour,
                        cardChid: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.mars,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Male", style: textStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender(false);
                        });
                      },
                      child: ReusableCard(
                        Colour: femaleColour,
                        cardChid: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FaIcon(
                                FontAwesomeIcons.venus,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Female", style: textStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ReusableCard(
                Colour: blueColor,
                cardChid: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Height", style: textStyle),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${heightSlider}", style: numtextStyle),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("cm", style: numtextStyle),
                        ),
                      ],
                    ),
                    Slider(
                      min: 100,
                      max: 200,
                      value: heightSlider.toDouble(),
                      activeColor: Colors.white,
                      inactiveColor: Colors.white70,
                      thumbColor: Colors.pink,
                      onChanged: (double value) {
                        setState(() {
                          heightSlider = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      Colour: blueColor,
                      cardChid: Column(
                        children: [
                          Text("Age", style: textStyle),
                          Text("${age}", style: numtextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: RoundButton(icon: FontAwesomeIcons.plus,
                                   onPressed: () {
                                     setState(() {
                                       addSubAge(true);
                                     });
                                   }),
                             ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        addSubAge(false);
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      Colour: blueColor,
                      cardChid:  Column(
                        children: [
                          Text("Weight", style: textStyle),
                          Text("${weight}", style: numtextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                  setState(() {
                                    addSubWeight(true);
                                  });
                                },),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RoundButton(icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                  setState(() {
                                    addSubWeight(false);
                                  });
                                },),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                calculateBMI();
              },
              child: Container(
                height: 50,
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Calculate BMI", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({super.key, required this.Colour, required this.cardChid});

  Color Colour;
  final Widget cardChid;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colour,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChid,
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}
