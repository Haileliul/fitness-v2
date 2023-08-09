import 'package:flutter/material.dart';
import '/Widgets/telebirr_footer.dart';
import 'package:url_launcher/url_launcher.dart';

class TeleBirrAccount extends StatelessWidget {
  TeleBirrAccount({super.key});

  // bool _saving = false;
  bool isEmailCorrect = false;
  bool ispasswordCorrect = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: SizedBox(
                    height: size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10,top: 10),
                              
                          child: Text(
                            'Login telebirr account to Pay',
                            style: TextStyle(
                              color: Color.fromARGB(255, 4, 139, 250),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),textAlign: TextAlign.center,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Mobile Number',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CTextField(
                            hintText: 'Enter Mobile Number',
                            keyboardType: TextInputType.emailAddress,
                            obscure: false,
                            onChanged: (val) {
                              emailController.text = val;
                              // isEmailCorrect = isEmail(val);
                            },
                            suffixIcon: null,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'Verification Code',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                             color: Colors.white70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CTextField(
                            hintText: 'Enter Verification Code',
                            keyboardType: TextInputType.emailAddress,
                            obscure: false,
                            onChanged: (val) {
                              emailController.text = val;
                              // isEmailCorrect = isEmail(val);
                            },
                            suffixIcon: null,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, top: 8),
                          child: Text(
                            'PIN',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Expanded(
                          child: CTextField(
                            hintText: 'Enter PIN',
                            keyboardType: TextInputType.emailAddress,
                            obscure: false,
                            onChanged: (val) {
                              emailController.text = val;
                              // isEmailCorrect = isEmail(val);
                            },
                            suffixIcon: null,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: CotainerButton(size: size,text: 'Next'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.14,horizontal: 5),
                  child: CotainerButton(size: size,text: 'Get Code'),
                ),
              ),
            ],
          ),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.21,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TelebirrFooter(
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
                    TelebirrFooter(
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
            ),
        ],
      ),
    ));
  }
}

class CotainerButton extends StatelessWidget {
  const CotainerButton({
    super.key,
    required this.size,
    this.text,
  });

  final Size size;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF010101),
            Color(0xFFF61E00),
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class CTextField extends StatelessWidget {
  CTextField({
    this.hintText,
    this.keyboardType,
    this.obscure,
    this.suffixIcon,
    this.onChanged,
    super.key,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscure;
  final IconButton? suffixIcon;

  final Function(dynamic val)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        onChanged: onChanged!,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        autofocus: false,
        keyboardType: keyboardType!,
        obscureText: obscure!,
        cursorColor: Colors.orange,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.orange,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.teal,
            ),
          ),
          suffixIcon: suffixIcon,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          hintText: hintText!,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 15,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 243, 241, 241),
        ),
      ),
    );
  }
}
