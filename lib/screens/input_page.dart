import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/card_child.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/icon_action_button.dart';
import 'package:bmi_calculator/bmi_calculation.dart';

enum Sex { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex selectedSex;
  int height = 180;
  int weight = 60;
  int age = 19;

  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //
  // void updateCardColour(Sex selectedSex) {
  //   if (selectedSex == Sex.male) {
  //     if (maleCardColour == inactiveCardColour) {
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     } else {
  //       maleCardColour = inactiveCardColour;
  //     }
  //   }
  //   if (selectedSex == Sex.female) {
  //     if (femaleCardColour == inactiveCardColour) {
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     } else {
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedSex = Sex.male;
                        });
                      },
                      colour: selectedSex == Sex.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: CardChild(
                        gender: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedSex = Sex.female;
                        });
                      },
                      colour: selectedSex == Sex.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: CardChild(
                        gender: 'FEMALE',
                        icon: FontAwesomeIcons.venus,
                      )),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kGenderTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kGenderTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x1FEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconActionButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10.0),
                              IconActionButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kGenderTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconActionButton(
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10.0),
                              IconActionButton(
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              BmiCalculation calc =
                  BmiCalculation(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResults: calc.bmiCalculator(),
                            resultTexts: calc.getResults(),
                            resultInterpretation: calc.resultInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
