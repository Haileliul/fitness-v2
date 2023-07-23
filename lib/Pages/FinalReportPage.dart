import 'package:flutter/material.dart';

import '../Widgets/chart.dart';

class FinalReportPage extends StatefulWidget {
  const FinalReportPage({super.key});

  @override
  State<FinalReportPage> createState() => _FinalReportPageState();
}

class _FinalReportPageState extends State<FinalReportPage> {
  static int indicator = 0;
  int _currentStep = 0;
  final List<Step> _steps = [
    const Step(
      title: Text('Monday'),
      content: Text('Content of Step 1'),
      isActive: true,
    ),
    const Step(
      title: Text('Tusday'),
      content: Text('Content of Step 2'),
      isActive: true,
    ),
    const Step(
      title: Text('Wednsday'),
      content: Text('Content of Step 3'),
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*  const Padding(
              padding: EdgeInsets.all(8.0),
              child: backButton(),
            ), */
            Expanded(
              child: Container(
                width: size.width * 0.98,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(
                    0.3,
                  ),
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: size.width,
                        height: size.height * 0.35,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(
                            0.3,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 28.0),
                          child: LineChartWidget(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 31.0),
                      child: SizedBox(
                        width: size.width,
                        height: size.height * 0.1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 20,
                              width: 100,
                              margin: const EdgeInsets.only(left: 5, top: 0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFF43800),
                                    Color.fromRGBO(244, 56, 0, 0),
                                    Color(0xFFF43800),
                                  ],
                                  stops: [0.0153, 0.9821, 0.9821],
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                ),
                                child: const Text(
                                  "week one",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 4,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          10,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          // physics: NeverScrollableScrollPhysics(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Stepper(
                              steps: _steps,
                              onStepTapped: (value) {
                                setState(() {
                                  _currentStep = value;
                                });
                              },
                              onStepContinue: () {
                                setState(() {
                                  _currentStep += 1;
                                });
                              },
                              onStepCancel: () {
                                if (_currentStep > 0) {
                                  setState(() {
                                    _currentStep -= 1;
                                  });
                                }
                              },
                              currentStep: _currentStep,
                              physics: const AlwaysScrollableScrollPhysics(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
