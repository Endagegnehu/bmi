import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/Icon_Content.dart';
import 'reusable_Card.dart';
import 'constants.dart';
import 'calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColor = KInActiveCardColor;
  Color femaleCardColor = KInActiveCardColor;

  int height = 180;
  int weight = 60;
  int age = 10;

  void upDateColor(Gender sex) {
    if (sex == Gender.male) {
      if (maleCardColor == KInActiveCardColor) {
        maleCardColor = KActiveCardColor;
        femaleCardColor = KInActiveCardColor;
      } else {
        maleCardColor = KInActiveCardColor;
      }
    }
    if (sex == Gender.female) {
      if (femaleCardColor == KInActiveCardColor) {
        femaleCardColor = KActiveCardColor;
        maleCardColor = KInActiveCardColor;
      } else {
        femaleCardColor = KInActiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI Caculator'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            upDateColor(Gender.male);
                          });
                        },
                        colour: maleCardColor,
                        cardChild: IconContent(FontAwesomeIcons.mars, 'MALE')),
                  ),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            upDateColor(Gender.female);
                          },
                          colour: femaleCardColor,
                          cardChild:
                              IconContent(FontAwesomeIcons.venus, 'FEMALE')))
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: KLabelForNumber,
                            ),
                            Text(
                              'cm',
                              style: KLabelTextStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                        ),
                      ],
                    ),
                  ))
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour: KActiveCardColor,
                        cardChild: Column(
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: KLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: KLabelForNumber,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
//                              FloatingActionButton(
//                                backgroundColor: Color(0xFF1C2933),
//                                child: Icon(Icons.add, color: Colors.white,),
//                              ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: KActiveCardColor,
                        cardChild: Column(
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: KLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: KLabelForNumber,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
//                              FloatingActionButton(
//                                backgroundColor: Color(0xFF1C2933),
//                                child: Icon(Icons.add, color: Colors.white,),
//                              ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              )),
              BottomButton(
                bottomTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIAnswer(
                                bmiResult: calc.calculateBMI(),
                                interpretation: calc.getInterpretation(),
                                resultText: calc.getResults(),
                              )));
                },
              )
            ],
          )),
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.bottomTitle});

  final Function onTap;
  final String bottomTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Color(0xFFEB1555),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: 50.0,
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
              child: Text(
            bottomTitle,
            style: kLargeButtonTextStyle,
          )),
        ),
      ),
    );
  }
}

//Container(
//margin: EdgeInsets.all(15.0),
//decoration: BoxDecoration(
//color: Color(0xFF1D1E33),
//borderRadius: BorderRadius.circular(10.0)),
//height: 200,
//width: 170,
//),

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      disabledElevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF1C2933),
    );
  }
}
