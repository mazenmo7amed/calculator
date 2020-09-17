import '../screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/Reusable_Card.dart';
import '../constance.dart';
import '../components/round_icon_button.dart';
import '../components/button_bottom.dart';
import '../calculator_brain.dart';

enum Gender{
  male, female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
     body: Column(
       crossAxisAlignment:  CrossAxisAlignment.stretch,
       children: <Widget>[
         Expanded(
             child: Row(
               children: <Widget>[
                 Expanded(child: ReusableCard(
                   onpress: (){
                     setState(() {
                       selectedGender=Gender.male;
                     });
                   },
                     colour:selectedGender ==Gender.male ?kactiveColor :kinactiveColor,
                   cardChild: iconContent(icon: FontAwesomeIcons.mars,label: 'Male'),
                 ),
                 ),

                 Expanded(child:ReusableCard(
                   onpress: (){
                     setState(() {
                       selectedGender=Gender.female;
                     });
                   },
                     colour: selectedGender ==Gender.female ?kactiveColor :kinactiveColor,
                   cardChild: iconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE'),
                 )
                 )
               ],
             )
             ),


         Expanded(child:ReusableCard(
             colour:kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: klabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      overlayColor: Color(0x29EB1555),
                      thumbColor: Color(0xffEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue ){
                          setState(() {
                            height=newValue.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
         )
         ),


         Expanded(child: Row(
           children: <Widget>[
             Expanded(child: ReusableCard(
                 colour: kactiveColor,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('WEIGHT',style: klabelTextStyle,),
                   Text(weight.toString(),style: kNumberTextStyle,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       RoundIconButton(
                         icon: FontAwesomeIcons.minus,
                         onpress:(){
                           setState(() {
                             weight--;
                           });
                         },
                       ),
                       SizedBox(width: 10.0,),
                       RoundIconButton(
                         icon: FontAwesomeIcons.plus,
                         onpress: (){
                           setState(() {
                             weight++;
                           });
                         },
                       ),
                     ],
                   )
                 ],
               ),

             )),
             Expanded(child: ReusableCard(
                 colour: kactiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',style: klabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpress: (){
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(width: 10.0,),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpress: (){
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
             ))
           ],
         )),

         BottomButton(
             onTap: (){
               CalculatorBrain calc =CalculatorBrain(height: height,weight:weight);
               Navigator.push(context, MaterialPageRoute(
                 builder: (context)=> ResultsPage(
                     bmiResult:calc.calculateBMI() ,
                     resultText: calc.getResult(calc.calculateBMI()),
                     interpretation: calc.getInterPretation(),
                   ),
               ));
             },
             buttonTitle:'CALCULATE'),
       ],
     ),
    );
  }
}