import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/home_page/home.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/screens/signUpEmail.dart';
import '../SLS.dart';
import '../core/constants.dart';
import 'package:email_validator/email_validator.dart';

// ignore: camel_case_types
class signin_email extends StatefulWidget {
  static String id = 'signin_email';

  @override
  _signin_emailState createState() => _signin_emailState();
}

enum FormType { login, register }

// ignore: camel_case_types
class _signin_emailState extends State<signin_email> {
  final _formkey = GlobalKey<FormState>();

  // three() {
  //   return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     password_forget(),
  //   ]);
  // }

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
              padding: const EdgeInsets.only(right: 12, top: 20),
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onTap: () {
              Get.to(() => signUpEmail());
            },
          ),
        ],
      ),
      backgroundColor: (KBackGroundColor),
      body: ListView(
        children: <Widget>[
          Container(
            height: SizeConfig.screenHeight! * 0.3,
            width: SizeConfig.screenWidth! * 0.3,
            child: Image.asset("assets/Belbali_logo.png"),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'Enter a UserName' : null,
                      decoration: InputDecoration(
                          hintText: 'Username or Email',
                          prefixIcon: Icon(
                            Icons.supervised_user_circle,
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
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      validator: (val) =>
                          val!.length < 8 ? 'Enter a password 8+ long' : null,
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
                ],
              )),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Builder(
              builder: (context) => RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                  color: KTextFeildSingUpColor,
                  child: Text('Log In',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
