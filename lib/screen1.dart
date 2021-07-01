import 'package:bmi_calculater_my/screen2.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'components.dart';
import 'package:ionicons/ionicons.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class Screen1 extends StatefulWidget {
  const Screen1({Key key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Color maleColor = kInactiveColor;
  Color femaleColor = kInactiveColor;
  Gender selectedGender;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.home_outlined,
              size: 40.0,
              color: kFontColor,
            ),
          ),
        ),
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: kFontColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            maleColor = kActiveColor;
                            femaleColor = kInactiveColor;
                            selectedGender = Gender.male;
                          });
                        },
                        child: ReusableCard(
                          colour: Colors.white,
                          widget: GenderWidget(
                            icon: Ionicons.man,
                            genderColor: maleColor,
                            text: 'Male',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            femaleColor = kActiveColor;
                            maleColor = kInactiveColor;
                            selectedGender = Gender.female;
                          });
                        },
                        child: ReusableCard(
                          colour: Colors.white,
                          widget: GenderWidget(
                            icon: Ionicons.woman,
                            genderColor: femaleColor,
                            text: 'Female',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Colors.white,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kCardTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: kLargeNumber,
                          ),
                          Text(
                            ' cm',
                            style: TextStyle(
                              color: kFontColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15,
                              elevation: 5,
                            ),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25),
                            thumbColor: kActiveColor,
                            overlayColor: kActiveColor.withAlpha(0x1f),
                            activeTrackColor: kActiveColor,
                            inactiveTrackColor: kInactiveColor,
                          ),
                          child: Slider(
                            onChanged: (double height) {
                              setState(() {
                                this.height = height.round();
                              });
                            },
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                          ),
                        ),
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
                        colour: Colors.white,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: kCardTextStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              weight.toString(),
                              style: kCardValueStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButtons(
                                  icon: Ionicons.remove,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundButtons(
                                  icon: Icons.add,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: Colors.white,
                        widget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Age',
                              style: kCardTextStyle,
                            ),
                            SizedBox(height: 10),
                            Text(
                              age.toString(),
                              style: kCardValueStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButtons(
                                  icon: Ionicons.remove,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                RoundButtons(
                                  icon: Icons.add,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
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
              SizedBox(height: 20),
              BottomButton(
                text: 'Calculate',
                onTap: () {
                  BMIBrain calc = BMIBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen2(
                          bmi: calc.calculate(),
                          category: calc.getCategory(),
                          description: calc.getDescription(),
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
