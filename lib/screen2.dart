import 'package:flutter/material.dart';
import 'constants.dart';
import 'components.dart';

class Screen2 extends StatelessWidget {
  Screen2({this.bmi, this.category, this.description});

  final String category;
  final String bmi;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Your Result',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kFontColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: ReusableCard(
                  colour: Colors.white,
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        category.toUpperCase(),
                        style: kResultCategory,
                      ),
                      Text(
                        bmi,
                        style: kLargeNumber,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: kIntroDescriptionStyle,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: BottomButton(
                  text: 'Start Again',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
