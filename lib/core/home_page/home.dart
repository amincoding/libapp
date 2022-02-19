import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Home"),
        ),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("SIGN OUT"),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ),
      ),
    );
  }
}
