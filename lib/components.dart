import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.text});
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: kIntroButtonStyle,
          ),
        ),
        margin: EdgeInsets.only(bottom: 12),
        width: 250,
        height: 70,
        decoration: BoxDecoration(
          color: kActiveColor,
          boxShadow: [
            BoxShadow(
              color: kActiveColor.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.widget});
  final Color colour;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: widget,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: kActiveColor.withOpacity(0.3),
            spreadRadius: 0.01,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(30),
        color: colour,
      ),
    );
  }
}

class GenderWidget extends StatelessWidget {
  GenderWidget({this.icon, this.genderColor, this.text});
  final IconData icon;
  final Color genderColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: genderColor,
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: genderColor,
          ),
        )
      ],
    );
  }
}

class RoundButtons extends StatelessWidget {
  RoundButtons({this.onPress, this.icon});
  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(
        icon,
        size: 25,
        color: kInactiveColor,
      ),
      fillColor: kActiveColor,
      elevation: 3.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 50,
      ),
    );
  }
}
