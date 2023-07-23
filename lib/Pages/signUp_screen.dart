import './login_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../translations/local_keys.g.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownSexValue = LocaleKeys.Male.tr();
  String dropdownAgeValue = '0';
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //  LocaleKeys.Login.tr(),

  Widget _buildNameTextField() {
    return TextField(
      focusNode: _nameFocusNode,
      controller: _nameController,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.hint_name.tr(),
        filled: true,
        fillColor: const Color(0xFFFFF6F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      focusNode: _emailFocusNode,
      controller: _emailController,
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      decoration: InputDecoration(
        hintText: LocaleKeys.Email.tr(),
        filled: true,
        fillColor: const Color(0xFFFFF6F6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      focusNode: _passwordFocusNode,
      controller: _passwordController,
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: LocaleKeys.Password.tr(),
        filled: true,
        fillColor: const Color(0xFFFFF6F6),
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
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }

  Widget _buildAgeButton() {
    return Container(
      height: 48,
      width: 116,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          ))),
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: DropdownButton(
          iconDisabledColor: Colors.black,
          iconEnabledColor: Colors.black,
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          onChanged: (newvalu) {
            setState(() {
              dropdownAgeValue = newvalu!;
            });
          },
          items: [
            DropdownMenuItem(
              value: '0',
              child: Text(
                LocaleKeys.Age.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const DropdownMenuItem(
              value: '0-10',
              child: Text(
                "0-10",
                style: TextStyle(color: Colors.black),
              ),
            ),
            const DropdownMenuItem(
              value: '11-23',
              child: Text(
                "11-23",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const DropdownMenuItem(
              value: '23-35',
              child: Text(
                "23-35",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const DropdownMenuItem(
              value: '35-45',
              child: Text(
                "35-45",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const DropdownMenuItem(
              value: '45-80',
              child: Text(
                "45-80",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          underline: const Text(" "),
          value: dropdownAgeValue,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSexButton() {
    return Container(
      height: 48,
      width: 116,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(
            10,
          ))),
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: DropdownButton(
          iconDisabledColor: Colors.black,
          iconEnabledColor: Colors.black,
          dropdownColor: Colors.white,
          focusColor: Colors.white,
          onChanged: (newvalu) {
            setState(() {
              dropdownSexValue = newvalu!;
            });
          },
          items: [
            DropdownMenuItem(
              value: LocaleKeys.Male.tr(),
              child: Text(
                LocaleKeys.Male.tr(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            DropdownMenuItem(
              value: LocaleKeys.Femaile.tr(),
              child: Text(
                LocaleKeys.Femaile.tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          underline: const Text(" "),
          value: dropdownSexValue,
          style: const TextStyle(
            color: Colors.white,
          ),
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
              image: AssetImage('assets/images/back.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
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
                      const SizedBox(
                        height: 20,
                      ),
                      _buildNameTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildEmailTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildPasswordTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildAgeButton(),
                          _buildSexButton(),
                        ],
                      ),
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
                            onPressed: () {
                              Navigator.pushNamed(context, '/Main');
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
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.have_an_account.tr(),
                            style: const TextStyle(
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
                                    builder: (_) => const LoginScreen(),
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
                                LocaleKeys.SignIn.tr(),
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
