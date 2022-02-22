import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viplive/core/utils/sizeConfig.dart';

class followUsScreen extends StatelessWidget {
  const followUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Follow us",
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.25,
            vertical: SizeConfig.screenHeight! * 0.15),
        children: [
          ListTile(
            leading: Image.asset("assets/facebook.png"),
            onTap: (() async {
              const url = 'https://facebook.com/belbalibrairie';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
            title: Text("Facebook"),
          ),
          Divider(
            height: 75,
          ),
          ListTile(
            leading: Image.asset("assets/instagram.png"),
            onTap: (() async {
              const url = 'https://instagram.com/ebi_library';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
            title: Text("Instagram"),
          ),
          Divider(
            height: 75,
          ),
          ListTile(
            leading: Image.asset("assets/phone-call.png"),
            onTap: (() async {
              String url = 'tel:' + "0660706139";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
            title: Text("Phone"),
          ),
          Divider(
            height: 75,
          ),
          ListTile(
            leading: Image.asset("assets/location.png"),
            onTap: (() async {
              String url = "https://goo.gl/maps/YhfhnDW5JiKsPpCeA";
              var urllaunchable =
                  await canLaunch(url); //canLaunch is from url_launcher package
              if (urllaunchable) {
                await launch(
                    url); //launch is from url_launcher package to launch URL
              } else {
                print("URL can't be launched.");
              }
            }),
            title: Text("Location"),
          )
        ],
      ),
    );
  }
}
