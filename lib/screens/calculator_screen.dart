import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../agevent/page/notes_page.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

enum Gender {
  note,
  agenda,
  parametre,
  progection
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
   late Gender ?selectedGender=null;
  String height = 'Info du jour';
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbare('ok', actions: []),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              colour: kInactiveCardColour,
              cardChild: Text(
                height,
                style: kEdit,
              ),
           onPress: () {  },
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.note;
                        });
                      },
                      colour: selectedGender == Gender.note
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.noteSticky,
                        label: 'Note',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          Navigator.push(
                                      context,
                              MaterialPageRoute(
                              builder: (context)=>NotesPage(),),
                          );
                          selectedGender = Gender.agenda;
                        });
                      },
                      colour: selectedGender == Gender.agenda
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.streetView,
                        label: 'Agenda',
                      ),

                    ),
                  ),
                ],
              )),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.progection;
                      });
                    },
                    colour: selectedGender == Gender.progection
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: Icons.adb_outlined,
                      label: 'GPT',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.parametre;
                      });
                    },
                    colour: selectedGender == Gender.parametre
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: Icons.settings,
                      label: 'Parametre',
                    ),
                  ),
                ),
                ////

              ],
            ),
          ),

        ],
      ),
    );
  }
}
