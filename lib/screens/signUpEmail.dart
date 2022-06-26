import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_list/expansion_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/core/widgets/space_widget.dart';
import 'package:viplive/screens/Provider/modelHUD.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/screens/thankyou_screen.dart';
import '../core/constants.dart';

// ignore: camel_case_types

class signUpEmail extends StatefulWidget {
  static String id = 'signUpEmail';

  @override
  _signUpEmailState createState() => _signUpEmailState();
}

// ignore: camel_case_types
class _signUpEmailState extends State<signUpEmail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _ruleController;
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool? _success;
  String? _userEmail;

  get user => null;

  Future<void> _register() async {
    try {
      final User? user =
          (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,

      ))
              .user;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        timeInSecForIosWeb: 3,
      );
      setState(() {
        _success = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, "5");
            },
          ),
        ],
      ),
      backgroundColor: (KBackGroundColor),
      body: ChangeNotifierProvider<ModelHUD>(
        create: (context) => ModelHUD(),
        child: ListView(
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight! * 0.2,
              width: SizeConfig.screenWidth! * 0.2,
              child: Image.asset("assets/Belbali_logo.png"),
            ),
            VerticalSpace(SizeConfig.screenHeight! * 0.001),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "please input youe username";
                        },
                        decoration: InputDecoration(
                            hintText: 'user name',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                    VerticalSpace(SizeConfig.screenHeight! * 0.001),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmail) {
                            return null;
                          }
                          return "please input a email";
                        },
                        decoration: InputDecoration(
                            hintText: 'E-mail',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                    VerticalSpace(SizeConfig.screenHeight! * 0.001),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if ((value!.isNumericOnly || value.isAlphabetOnly) &&
                              value.isNotEmpty &&
                              value.length < 8) {
                            return "Enter a stronger password more that 8 charachters";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                    VerticalSpace(SizeConfig.screenHeight! * 0.001),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _phoneNumberController,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "please input youe phone number";
                        },
                        decoration: InputDecoration(
                            hintText: 'phone number',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                    VerticalSpace(SizeConfig.screenHeight! * 0.003),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: ExpansionList<String>(
                        onItemSelected: (item) {
                          setState(() {
                            _ruleController = item.toString();
                          });
                        },
                        items: ['Admin', 'User'],
                        title: "Rules",
                      ),
                    ),
                    VerticalSpace(SizeConfig.screenHeight! * 0.003),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        maxLines: 5,
                        controller: _adressController,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          }
                          return "please input youe adress";
                        },
                        decoration: InputDecoration(
                            hintText: 'adress',
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                  ],
                )),
            VerticalSpace(SizeConfig.screenHeight! * 0.001),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _register();
                      if (user != null) {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(user.uid)
                            .set({
                          "user_name": _usernameController.toString(),
                          "full_name": _fullNameController.toString(),
                          "rule": _ruleController.toString(),
                          "adress": _adressController.toString(),
                          "phone_number": _phoneNumberController
                        }).then((value) {
                          Navigator.popAndPushNamed(context, "5");
                        });
                      }
                    }
                  },
                  color: KTextFeildSingUpColor,
                  child: Text('Sign up',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
