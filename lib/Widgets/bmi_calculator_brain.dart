// import 'dart:math';
//
// class CalculatorBrain {
//   CalculatorBrain({this.weight, this.height});
//   final int height;
//   final int weight;
//   double _bmi=0.0;
//   String calculateBmi() {
//     _bmi = weight / pow(height / 100, 2);
//     return _bmi.toStringAsFixed(1);
//   }
//
//   String getResult() {
//     if (_bmi >= 25) {
//       return ('Over Weight');
//     } else if (_bmi > 18.5) {
//       return ('Normal');
//     } else {
//       return ('Under Weight');
//     }
//   }
//
//   String getInterpretation() {
//     if (_bmi >= 25) {
//       return ('you have higher than normal body weight: \n You should exercise more!');
//     } else if (_bmi > 18.5) {
//       return ('you have  normal body weight: \n Good job!');
//     } else {
//       return ('you have lower than normal body weight: \n You should eat more!');
//     }
//   }
// }
import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});
  final int height;
  final int weight;
  double _bmi = 0.0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return ('Over Weight');
    } else if (_bmi > 18.5) {
      return ('Normal');
    } else {
      return ('Under Weight');
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return ('you have higher than normal body weight: \n You should exercise more!');
    } else if (_bmi > 18.5) {
      return ('you have  normal body weight: \n Good job!');
    } else {
      return ('you have lower than normal body weight: \n You should eat more!');
    }
  }
}