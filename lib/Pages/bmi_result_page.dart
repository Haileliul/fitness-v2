import 'package:flutter/material.dart';
import 'package:fitness/Widgets/bmi_reusable_card.dart';
import 'package:fitness/constants/bmi_constants.dart';
import 'package:fitness/Widgets/bmi_bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {super.key, required this.bmiResult,
        required this.interpretation,
        required this.resultText});
  String bmiResult;
  String resultText;
  String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: const Text(
                'YOUR RESULT',
                style: kLargeTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RECALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
