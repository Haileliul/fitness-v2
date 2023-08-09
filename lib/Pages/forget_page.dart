import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:validators/validators.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  Size? size;
  bool _saving = false;
  bool isEmailCorrect = false;

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void snackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Center(
            child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padd = MediaQuery.of(context).padding.top;

    // final appbarsize =;
    return SafeArea(
        child: SizedBox(
      height: size.height - padd,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 244, 244),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: const Text(
            'Reset Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: ModalProgressHUD(
          progressIndicator:
              const CircularProgressIndicator(color: Colors.grey),
          inAsyncCall: _saving,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/resetp.png",
                    height: size.height * 0.35,
                    width: size.width,
                  ),
                  const Text(
                    'Enter your email and we will \nsend you password reset link',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  CTextField(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    obscure: false,
                    onChanged: (val) {
                      isEmailCorrect = isEmail(val);
                      emailController.text = val;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: isEmailCorrect == false
                          ? () {
                              snackbar('please correct your mail');
                            }
                          : () async {
                              setState(() {
                                _saving = true;
                              });
                              try {
                                // backend part of code
                                // backend part of code
                                // backend part of code
                                setState(() {
                                  _saving = false;
                                });
                                snackbar(
                                    'Password reset sent! check your email');
                              } on FirebaseAuthException catch (e) {
                                print(e);
                                snackbar(e.message.toString());
                                setState(() {
                                  _saving = false;
                                });
                              }
                            },
                      child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
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
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: Text(
                                'Reset password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class CTextField extends StatelessWidget {
  CTextField({
    this.hintText,
    this.keyboardType,
    this.obscure,
    this.onChanged,
    super.key,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscure;

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
        // obscureText: obscure!,
        // cursorColor: Colors.orange,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
                // color: Colors.orange,
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.teal,
            ),
          ),
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
