import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;

const kActiveCardColour = Colors.transparent;
const kInactiveCardColour = Colors.transparent ;
const kBottomContainerColour = Color(0xFFEB1555);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white,);
const kEdit = TextStyle(
  fontSize: 18.0,
  color: Colors.black,);
const kDetail= TextStyle(
color: Colors.black,
fontSize: 22,
fontWeight: FontWeight.bold,
);
const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,

);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);
Appbare(String title, {required List<Widget> actions}){
  return AppBar(
    title: Text(title,style: kLabelTextStyle,),
    backgroundColor: Colors.lightBlue.shade900,
    actions:actions,
  );
}

