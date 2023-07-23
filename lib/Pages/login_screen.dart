import 'package:flutter/material.dart';
import 'signUp_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/local_keys.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dropdownValue = 'am';
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isObscured = true;

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildPasswordTextField() {
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      obscureText: _isObscured,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
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
    return Scaffold(
      body: SingleChildScrollView(
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
                height: 100,
              ),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    'assets/images/fitness-sport-gym-logo-real - Copy.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 26),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(217, 217, 217, 0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.Login.tr(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        focusNode: _emailFocusNode,
                        controller: _emailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
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
                      const SizedBox(
                        height: 20,
                      ),
                      _buildPasswordTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 48,
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
                            onPressed: () {},
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
    );
  }
}
