import 'package:fitness/Widgets/backButton.dart';
import 'package:flutter/material.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  List<String> containerContents = [
    'CBE Birr',
    'CBE Mobile Banking',
    'Dashen Amole',
  ]; // Example list of container contents
  List<String> containerImages = [
    'assets/images/cbe_birr.png',
    'assets/images/cbe_mobile_banking.png',
    'assets/images/dashen_amole.png',
  ]; // Example list of container images

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 50.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: backButton(),
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.9,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Container(
                          // color: Colors.amber,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/rectangle49.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 10.0,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(217, 217, 217, 0.50),
                          ),
                          child: GridView.builder(
                            itemCount: containerContents.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 6),
                            ),
                            itemBuilder: (context, index) {
                              String content = containerContents[index];
                              String image = containerImages[
                                  index % containerImages.length];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 12.0,
                                ),
                                child: SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xFFF43800),
                                          Color.fromRGBO(244, 56, 0, 0),
                                          Color(0xFFF43800),
                                        ],
                                        stops: [0.0153, 0.9821, 0.9994],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 4.0,
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                image,
                                                height: size.height * 0.09,
                                              ),
                                              Text(content),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                const Color.fromRGBO(
                                                    0, 0, 0, 0.7),
                                              ),
                                              alignment: Alignment.center,
                                              minimumSize: MaterialStateProperty
                                                  .all<Size>(
                                                const Size(70,
                                                    30), // Adjust the width and height as desired
                                              ),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                const Color.fromRGBO(
                                                    217, 217, 217, 0.5),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/Schedule');
                                            },
                                            child: const Text('Buy'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
