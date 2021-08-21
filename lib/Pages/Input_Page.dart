import 'package:bmi_calculator/COMPONENTS/Calc_Card.dart';
import 'package:bmi_calculator/Pages/Results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/COMPONENTS/Card.dart';
import 'package:bmi_calculator/COMPONENTS/Icon_with_Title.dart';
import 'package:bmi_calculator/COMPONENTS/Card_With_GestureDetect.dart';
import '../Constants/constants.dart';
import 'package:bmi_calculator/BMI_Brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 120;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CardWithoutExpanded(
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            colour: selectedGender == Gender.male
                                ? kActiveCardColor
                                : kInactiveCardColor,
                            borderColour: selectedGender == Gender.male
                                ? Colors.white : kInactiveCardColor,
                            cardChild: IconWithTitle(
                              title: "Male",
                              icon: FontAwesomeIcons.mars,
                            ))),
                    Expanded(
                        child: CardWithoutExpanded(
                            onPressed: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            colour: selectedGender == Gender.female
                                ? kActiveCardColor
                                : kInactiveCardColor,
                            borderColour: selectedGender == Gender.female
                                ? Colors.white : kInactiveCardColor,
                            cardChild: IconWithTitle(
                              title: "Female",
                              icon: FontAwesomeIcons.venus,
                            ))),
                  ],
                ),
              ),
              ResuseableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Height",
                    style: kSubtitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTitleStyle,),
                        Text("cm", style: kSubtitleStyle,),
                        
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(value: height.toDouble(),
                          min: kMin,
                          max: kMax,
                          activeColor: Color(0xffeb1555),
                          inactiveColor: Color(0xff8d8e98),
                          onChanged: (double newHeight){
                            setState(() {
                              height = newHeight.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    ResuseableCard(cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight", style: kSubtitleStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kTitleStyle,),
                            SizedBox(width: 2,),
                            Text("lbs", style: kSubtitleStyle,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 12),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        )
                      ],
                    ),),
                    ResuseableCard(cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age", style: kSubtitleStyle,),
                        Text(age.toString(), style: kTitleStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){setState(() {
                              age--;
                            });}),
                            SizedBox(width: 12,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){setState(() {
                              age++;
                            });}),
                          ],
                        )
                      ],
                    ),),
                  ],
                ),
              ),
              CalcButton(text: "Calculate",
              onTap: (){
                BMIBrain brain = BMIBrain(height: height,weight: weight);
                brain.calcBMI();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: brain.calcBMI(), resultText: brain.showResults(), interp: brain.getInterpretation())));
              },
              )
            ],
          ),
        ));
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed:onPressed,
      shape:CircleBorder() ,
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
    ),
      elevation: 3.0,

    );
  }
}
