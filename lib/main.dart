import 'package:bmi/constants.dart';
import 'package:bmi/reusable_Card.dart';
import 'package:flutter/material.dart';
import 'package:bmi/Input_Page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
        textTheme: TextTheme(body1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}

class BMIAnswer extends StatelessWidget {
  BMIAnswer({this.bmiResult,this.interpretation,this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Center(
                child: Container(
            child: Text(
                'Your Result',
                style: kTitleTextStyle,
            ),
          ),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(resultText,style: KResultTextStyle,),
                        Text(bmiResult, style: KLabelForNumberBMIResult,),
                        Center(
                          child: Text(interpretation,
                          textAlign: TextAlign.center,
                          style: KBMIMessage,),
                        ),
                      ],
                    ),
            ),
          ),
         BottomButton(bottomTitle: 'RE-CALCULATE',onTap: (){
           Navigator.pop(context);
         },)
        ],
      ),
    );
  }
}
