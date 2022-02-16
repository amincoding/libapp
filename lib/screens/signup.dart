import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:viplive/screens/signin_email.dart';
import '../screens/signUpEmail.dart';
import '../core/constants.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  static String id = 'signup';

  @override
  _signupState createState() => _signupState();
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: SvgPicture.asset('assets/back_appBar.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 14),
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
              Navigator.pushNamed(context, signin_email.id);
            },
          ),
        ],
      ),
      backgroundColor: (KBackGroundColor),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.2, right: 30, top: height * 0.2, bottom: 50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // Image(
                  //   image: AssetImage('assets/logo.ico'),
                  // ),
                  Center(
                    heightFactor: 0.5,
                    child: Container(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'BUSINESS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: KFont,
                                    fontSize: 30,
                                    color: Colors.teal)),
                            TextSpan(
                                text: ' CARD                 ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xFFF010101))),
                            TextSpan(
                                text: 'Mr demri Project',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: KFont,
                                    fontSize: 13,
                                    color: Colors.pink)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                  color: KTextFeildSingUpColor,
                  child: Text('Sign up with Facebook',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      )))),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                  color: KTextFeildSingUpColor,
                  child: Text('Sign up with Google',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      )))),
          SizedBox(
            height: height * 0.03,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    Navigator.pushNamed(context, signUpEmail.id);
                  },
                  color: KTextFeildSingUpColor,
                  child: Text('Sign up with E-mail',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KBackGroundColor,
                      )))),
          SizedBox(
            height: height * 0.03,
          ),
        ],
      ),
    );
  }
}
