import 'dart:math';
class BMIBrain{
  final int height;
  final int weight;
  double _bmi;

  BMIBrain({this.weight, this.height});

  String calcBMI(){
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
}
String showResults(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi > 18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }
}

String getInterpretation(){
  if(_bmi >= 25){
    return 'Dishonor on you, dishonor on your family, YOU FAT COW';
  }
  else if(_bmi > 18.5){
    return "Ole Normal ass roach";
  }
  else{
    return "Eat a burger, ya dang xylophone";
  }
}

}