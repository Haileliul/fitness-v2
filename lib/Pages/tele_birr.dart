import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fitness/Provider/provider.dart';
import 'package:provider/provider.dart';

class TeleBirr extends StatelessWidget {
   TeleBirr({super.key});
  var pro;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    pro = Provider.of<PayDataProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white12,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                elevation: 3,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.18,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Payment for Exercises',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 4, 139, 250),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: size.width * 0.28,
                                      child: const Text(
                                        'CompanyName:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title: const Text(
                                      'Kuraz Technology',
                                      style: TextStyle(
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: size.width * 0.28,
                                      child: const Text(
                                        ' Amount:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title: const Text(
                                      '1000 ETB',
                                      style: TextStyle(
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: size.width * 0.28,
                                      child: const Text(
                                        ' PayTime:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title:  Text(
                                     '${pro.time.day}/${pro.time.month}/${pro.time.year} G.C' ,
                                      style: const TextStyle(
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    leading: SizedBox(
                                      width: size.width * 0.28,
                                      child: const Text(
                                        ' ExpiredTime:',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    title: const Text(
                                      '170s',
                                      style: TextStyle(
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 7,
                            child: SizedBox(
                              height: size.height * 0.42,
                              // width: size.width * 0.55,
                              child: Card(
                                shape: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                shadowColor: Colors.grey,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'scan to pay(1000 ETB)',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/payment_getway/qrscan.png',
                                        height: 90,
                                        width: 100,
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                      ListTile(
                                        leading: Image.asset(
                                          'assets/images/payment_getway/scanArea.png',
                                          height: 25,
                                          width: 25,
                                          color: Colors.blue,
                                        ),
                                        title: const Text(
                                          'Turn on the telebirr APP  and scan the code.',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final url =
                                              'https://play.google.com/store/apps/details?id=cn.tydic.ethiopay&hl=en_US';
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url));
                                          }
                                        },
                                        child: const Text(
                                          'For the first time, please download the telebirr APP',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: SizedBox(
                              height: size.height * 0.42,
                              child: Card(
                                color: Colors.white70,
                                elevation: 1,
                                shadowColor: Colors.grey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 3,
                                            color: Colors.grey,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(blurRadius: 1)
                                          ]),
                                      child: Image.asset(
                                        'assets/images/payment_getway/telebirr.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 2),
                                      child: Divider(
                                        thickness: 6,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 21, 21, 214),
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 3),
                                            child: Text(
                                              'Login telebirr account to pay',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 7,
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    futterContainer(
                      size: size,
                      onTap: () async {
                        String phoneNumber = '+251127';
                        final url = 'tel:$phoneNumber';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          launchUrl(Uri.parse(url));
                        }
                      },
                      image: 'assets/images/payment_getway/callcenter.png',
                      text1: 'telebirr contact center',
                      text2: '+251 127',
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    futterContainer(
                      size: size,
                      onTap: () async {
                        const url = 'https://www.ethiotelecom.et';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          launchUrl(Uri.parse(url));
                        }
                      },
                      image: 'assets/images/payment_getway/web.png',
                      text1: 'Ethio Telecom Web',
                      text2: 'Ethiotelecom.et',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class futterContainer extends StatelessWidget {
  futterContainer(
      {super.key,
      required this.size,
      this.onTap,
      this.image,
      this.text1,
      this.color,
      this.text2});

  final Size size;
  final Function()? onTap;
  final String? text1;
  final String? image;
  final Color? color;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
          ),
        ],
      ),
      height: size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            height: 50,
            width: 50,
            color: color!,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              text1!,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          InkWell(
            onTap: onTap!,
           
            child: Text(
              text2!,
              style: const TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
