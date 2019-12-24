import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/Icon_Content.dart';
import 'reusable_Card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;

  void upDateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inActiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inActiveCardColor;
      } else {
        maleCardColor = inActiveCardColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColor == inActiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inActiveCardColor;
      } else {
        femaleCardColor = inActiveCardColor;
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
            children: <Widget>[
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          upDateColor(1);
                        });
                      },
                      child: ReusableCard(maleCardColor,
                          IconContent(FontAwesomeIcons.mars, 'MALE')),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            upDateColor(2);
                          });
                        },
                        child: ReusableCard(femaleCardColor,
                            IconContent(FontAwesomeIcons.venus, 'FEMALE')),
                      ))
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(activeCardColor, null))
                ],
              )),
              Expanded(
                  child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(activeCardColor, null),
                  ),
                  Expanded(
                    child: ReusableCard(activeCardColor, null),
                  )
                ],
              )),
              Container(
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 20.0,
              )
            ],
          )),
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
