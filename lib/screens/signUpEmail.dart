import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
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
  bool _checked = false;
  final _formkey = GlobalKey<FormState>();
  String? _email;
  String? _username;
  String? _password;
  String? error;

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
              padding: const EdgeInsets.only(right: 15, top: 20),
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
              Get.to(() => signin_email());
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
              height: SizeConfig.screenHeight! * 0.3,
              width: SizeConfig.screenWidth! * 0.3,
              child: Image.asset("assets/Belbali_logo.png"),
            ),
            SizedBox(
              height: height * 0.1,
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
                        onSaved: (val) {
                          setState(() => _username = val);
                        },
                        decoration: InputDecoration(
                            hintText: 'Username',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        validator: (val) => val!.endsWith('com') ||
                                !val.contains('@') ||
                                !val.contains('.')
                            ? 'not valid'
                            : null,
                        onChanged: (val) {
                          setState(() => _email = val);
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
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        validator: (val) =>
                            val!.length < 8 ? 'Enter a password 8+ long' : null,
                        onChanged: (val) {
                          setState(() => _password = val);
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
                  ],
                )),
            SizedBox(
              height: height * 0.01,
            ),
            CheckboxListTile(
              title: Text("I accept the Terms of Use"),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked,
              activeColor: Colors.pink[200],
              checkColor: Colors.white,
              onChanged: (bool? value) {
                setState(() {
                  value = true;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Builder(
                builder: (context) => RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      Get.to(() => thankyou_screen());
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
            ),
          ],
        ),
      ),
    );
  }
}
