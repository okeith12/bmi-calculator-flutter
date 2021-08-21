import 'package:bmi_calculator/COMPONENTS/Calc_Card.dart';
import 'package:bmi_calculator/Pages/Input_Page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/COMPONENTS/Card.dart';
import '../Constants/constants.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interp});
  final String bmiResult;
  final String resultText;
  final String interp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Your Results",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ResuseableCard(
            flex: 5,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText.toUpperCase(),
                  style: TextStyle(
                    color: Color(0xff24d876),
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  bmiResult,
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  interp,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
              ],
            ),
          ),
          CalcButton(text: "Re-Calculate",  onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
          },),
        ],
      ),
    );
  }
}

