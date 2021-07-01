import 'package:flutter/material.dart';
import 'constants.dart';
import 'screen1.dart';
import 'components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'BMI Calculator',
                style: kIntroTileStyle,
              ),
              Image.asset('images/bmi.png'),
              Text(
                'BMI is a measurement of a person\'s leanness or corpulence based on their height and weight, and is intended to quantify tissue mass. It is widely used as a general indicator of whether a person has a healthy body weight for their height.',
                textAlign: TextAlign.center,
                style: kIntroDescriptionStyle,
              ),
              BottomButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen1()));
                },
                text: 'Let\'s Find !',
              )
            ],
          ),
        ),
      ),
    );
  }
}
