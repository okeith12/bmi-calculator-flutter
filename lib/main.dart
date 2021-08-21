import 'package:bmi_calculator/Pages/Results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Pages/Input_Page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0a0e21), //-- add 0xFF to the beginning of your hex code say that the color's opacity is 100%, changing that change the opacity
          scaffoldBackgroundColor: Color(0xFF0a0e21),
      ),
      home: InputPage(),
      routes: {
        '/results': (context) => ResultsPage(),
      },
    );
  }
}

