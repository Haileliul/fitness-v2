import 'package:fitness/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Chapa extends StatelessWidget {
  Chapa({super.key});
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.12,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Color.fromARGB(255, 10, 92, 114),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: size.height * 0.03,
                        ),
                        child: Image.asset(
                          'assets/images/payment_getway/chapaLogo.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.08,
                      ),
                      child: Container(
                          height: size.height * 0.1,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 5, color: Colors.grey)
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Amount to pay',
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                ),
                                Text(
                                  '1000 ETB',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    color: Colors.white30,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF90EE02).withOpacity(0.9),
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/payment_getway/etFlag.jpg',
                            height: 40,
                            width: 40,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 50, top: 8),
                            child: Text(
                              '|',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    hintText: '09********',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: Icon(
                      FontAwesomeIcons.shieldHeart,
                      color: const Color(0xFF90EE02).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/Schedule');
                    },
                    child: Card(
                      color: const Color(0xFF90EE02).withOpacity(0.9),
                      child: Center(
                        child: Text(
                          Provider.of<PayDataProvider>(context)
                              .chapa[selectedIndex]['name'],
                          style: const TextStyle(
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
              SizedBox(
                width: size.width,
                height: size.height * 0.5,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    var pm = Provider.of<PayDataProvider>(context).chapa[index];
                    var selected =
                        Provider.of<PayDataProvider>(context, listen: false)
                            .selectedChapaIndex;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Provider.of<PayDataProvider>(context,
                                        listen: false)
                                    .changeChapaIndex(index);
                                selectedIndex = selected;
                              },
                              child: Container(
                                // height: 50,width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: index == selected
                                        ? Border.all(
                                            width: 2,
                                            color: const Color(0xFF90EE02)
                                                .withOpacity(0.9),
                                          )
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.grey,
                                      ),
                                    ],
                                    color: Colors.white),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        pm['imagename'],
                                        width: 70,
                                        height: 50,
                                      ),
                                    ),
                                    index == selected
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2, right: 2),
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                size: 20,
                                                color: const Color(0xFF90EE02)
                                                    .withOpacity(0.9),
                                              ),
                                            ),
                                          )
                                        : const Align(
                                            alignment: Alignment.topRight,
                                            child: Text('   ')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              pm['name'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: Provider.of<PayDataProvider>(context).chapa.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
