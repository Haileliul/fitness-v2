import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness/Provider/provider.dart';
import 'package:fitness/Widgets/backButton.dart';

class PaymentGatewayScreen extends StatefulWidget {
  const PaymentGatewayScreen({super.key});

  @override
  State<PaymentGatewayScreen> createState() => _PaymentGatewayScreenState();
}

class _PaymentGatewayScreenState extends State<PaymentGatewayScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/payment_getway/Rectangle 50.png'),
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
                              image: AssetImage('assets/images/payment_getway/rectangle49.png'),
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

                          // String content = containerContents[index];
                          // String image = containerImages[
                          child: //     index % containerImages.length];
                              Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 12.0,
                            ),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text(
                                      'SELECT PAYMENT METHOD',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 30),
                                    child: SizedBox(
                                      height: 70,
                                      child: ListView.builder(
                                        
                                          itemCount:
                                              Provider.of<PayDataProvider>(
                                                      context)
                                                  .paymentM
                                                  .length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            var cat =
                                                Provider.of<PayDataProvider>(
                                                        context)
                                                    .paymentM[i];
                                            var selected =
                                                Provider.of<PayDataProvider>(
                                                        context,
                                                        listen: false)
                                                    .selectedPaymentIndex;
                                            return InkWell(
                                              onTap: () {
                                                Provider.of<PayDataProvider>(
                                                        context,
                                                        listen: false)
                                                    .changePaymentIndex(i);
                                                index = selected;
                                              },
                                              child: Card(
                                                elevation: 10,
                                                shadowColor: Colors.grey,
                                                shape: i == selected
                                                    ? Border.all(
                                                        width: 2,
                                                        color: Colors.amber)
                                                    : null,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    cat['titleimage'],
                                                    width: size.width * 0.3,
                                                    height: size.height * 0.1,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                                    child: Text('Phone Number:(Optional)'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: TextField(
                                      textAlign: TextAlign.left,
                                      keyboardType: TextInputType.phone,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        disabledBorder:
                                            const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(5),
                                                ),
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: const Color(0xFF90EE02)
                                                  .withOpacity(0.9)),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Phone NO:',
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      index == 1
                                          ? Navigator.pushNamed(
                                              context, '/telebirr')
                                          : Navigator.pushNamed(
                                              context, '/chapa');
                                    },
                                    child:  Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 15),
                                      child: SizedBox(
                                        height: size.height * 0.1,
                                        child:  Card(
                                          color:const Color(0xFF90EE02).withOpacity(0.9),
                                          child: const Center(
                                            child: Text(
                                              'Proceed Payment',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

