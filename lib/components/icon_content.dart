import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(

          icon,color: Colors.black,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kEdit,
        )
      ],
    );
  }
}
