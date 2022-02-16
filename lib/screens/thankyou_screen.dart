import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:viplive/core/home_page/homePage.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import '../core/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class thankyou_screen extends StatefulWidget {
  static String id = 'thankyou_screen';

  @override
  _thankyou_screenState createState() => _thankyou_screenState();
}

// ignore: camel_case_types
class _thankyou_screenState extends State<thankyou_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (KBackGroundColor),
      body: ListView(children: <Widget>[
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset("assets/Belbali_logo.png"),
              ),
              Container(
                child: SvgPicture.asset('assets/checked.svg'),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.03),
              Container(
                width: SizeConfig.screenWidth! * 1,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '''Thank you  
For Your Registration ''',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.01),
              Center(
                child: Divider(
                  thickness: 2,
                ),
              ),
              SizedBox(
                width: SizeConfig.screenHeight! * 0.03,
              ),
              Container(
                child: SvgPicture.asset('assets/exclamation.svg'),
              ),
              SizedBox(height: SizeConfig.screenHeight! * 0.03),
              Container(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text:
                          'your request has been sent to one of our admins , once you are accepted you will be notified throw an email',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.05,
              ),
              Container(
                height: SizeConfig.screenHeight! * 0.06,
                width: SizeConfig.screenWidth! * 0.8,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      Get.to(() => HomePage(),
                          transition: Transition.rightToLeft);
                    },
                    color: KTextFeildSingUpColor,
                    child: Text('GO TO HOME SCREEN',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: KBackGroundColor,
                        ))),
              )
            ]),
      ]),
    );
  }
}
