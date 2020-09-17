import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constance.dart';
import '../components/Reusable_Card.dart';
import '../components/button_bottom.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required this.resultText,@required this.interpretation});

  final String bmiResult;
  final String resultText;
 final String interpretation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle,),
              )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              )),

          BottomButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}






