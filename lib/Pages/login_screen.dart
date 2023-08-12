import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'signUp_screen.dart';
import 'package:validators/validators.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../translations/local_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mainUrl = "https://fitness-backend-production.up.railway.app/";
  String Api = "signIn";
  bool isEmailCorrect = false;
  bool ispasswordCorrect = false;
  bool _modal = false;

  bool check() {
    if ((isEmailCorrect & ispasswordCorrect) == true) {
      return false;
    }
    return true;
  }

  void MessageflutterToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void wrongMessageDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: Border.all(
                color: Colors.red, width: 2, style: BorderStyle.none),
            title: Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        });
  }

  void wrongMessageBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Future<void> signInUser(String email, String password) async {
    try {
      setState(() {
        _modal = true;
      });
      final response = await http.post(
        Uri.parse(mainUrl + Api),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        MessageflutterToast('Login successfully! ');
        print(response.statusCode);
        Navigator.pushNamed(context, '/Main');
      } else if (response.statusCode == 404) {
        MessageflutterToast('user not found please check email and password');
        print(response.statusCode);
      } else if (response.statusCode == 503) {
        MessageflutterToast('Service Unavailable please fill again!');
        print(response.statusCode);
      } else {
        MessageflutterToast('StatusCode ${response.statusCode} error');
        print(response.statusCode);
      }
      setState(() {
        _modal = false;
      });
    } catch (error) {
      wrongMessageDialog('connection problem ');
      setState(() {
        _modal = false;
      });
    }
  }

  String dropdownValue = 'am';
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  bool _isObscured = true;
  String errortextPassword = '';
  String errortextEmail = '';

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildPasswordTextField() {
    return TextField(
      onChanged: (val) {
        _passwordController.text = val;
        setState(() {
          if (_passwordController.text.length >= 6) {
            errortextPassword = '';
            ispasswordCorrect = true;
          } else {
            errortextPassword = 'please enter 6 or more characters';
          }
        });
      },

      focusNode: _passwordFocusNode,
      // controller: _passwordController,
      obscureText: _isObscured,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        errorText: _emailController.text.isEmpty ? null : errortextPassword,
        errorStyle: const TextStyle(color: Colors.red),
        hintText: LocaleKeys.Password.tr(),
        filled: true,
        fillColor: const Color(0xFFFFF6F6),
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: IconButton(
          icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          progressIndicator:
              const CircularProgressIndicator(color: Colors.grey),
          inAsyncCall: _modal,
          child: SingleChildScrollView(
            //  physics: const NeverScrollableScrollPhysics(),
            physics: const ScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton(
                        onChanged: (newvalu) async {
                          setState(() {
                            dropdownValue = newvalu!;
                          });
                          await context.setLocale(Locale("$newvalu"));
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text("Eng"),
                          ),
                          DropdownMenuItem(
                            value: 'am',
                            child: Text(
                              "አማ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        value: dropdownValue,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  //
                  const SizedBox(
                    height: 95,
                  ),
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(
                        'assets/images/fitness-sport-gym-logo-real - Copy.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.485,
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/forgot');
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            LocaleKeys.Login.tr(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (val) {
                                _emailController.text = val;
                                setState(() {
                                  if (isEmail(val)) {
                                    errortextEmail = '';
                                    isEmailCorrect = true;
                                  } else {
                                    errortextEmail = 'invalid email';
                                  }
                                });
                              },
                              focusNode: _emailFocusNode,
                              // controller: _emailController,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                errorText: _emailController.text.isEmpty
                                    ? null
                                    : errortextEmail,
                                errorStyle: const TextStyle(color: Colors.red),
                                hintText: LocaleKeys.Email.tr(),
                                hintStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFFFF6F6),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(child: _buildPasswordTextField()),
                          //  SizedBox(
                          //   height: 30,
                          //   child:
                          //      Align(alignment: Alignment.topRight,
                          //        child: TextButton(
                          //          onPressed: () {
                          //            Navigator.pushNamed(context, '/forgot');
                          //          },
                          //          child:  Text(
                          //            'Forgot Password?',
                          //            style: TextStyle(
                          //              color: Colors.green.shade200,
                          //              fontWeight: FontWeight.bold,
                          //              fontSize: 10,
                          //            ),
                          //          ),
                          //        ),
                          //      ),
                          // ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 30,
                              width: 124,
                              margin: const EdgeInsets.only(left: 0, top: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(56),
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
                              child: ElevatedButton(
                                onPressed: check()
                                    ? () {}
                                    //() {
                                    //     if (isEmailCorrect == false) {
                                    //       wrongMessageBar('Incorrect Email');
                                    //     } else if(ispasswordCorrect == false) {
                                    //       wrongMessageBar(
                                    //           'password must be at least 6 characters');
                                    //     }
                                    //   }
                                    : () {
                                        signInUser(_emailController.text,
                                            _passwordController.text);
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                ),
                                child: Text(
                                  LocaleKeys.SignIn.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.have_no_account.tr(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: 26,
                                width: 100,
                                margin: const EdgeInsets.only(left: 5, top: 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(56),
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
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const SignUpScreen(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(56),
                                    ),
                                  ),
                                  child: Text(
                                    LocaleKeys.Sign_up.tr(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
