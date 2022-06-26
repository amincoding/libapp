import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viplive/core/utils/user.dart';

class ourDataBase {

  final FirebaseFirestore  _firestore = FirebaseFirestore.instance;

  Future<String> creatUser (ourUser user) async {
    String retval = "error";
    try{
      await _firestore.collection("user").doc(user.uid).set({
        "fullName" : user.FullName,
        "email" : user.email,
        "Roll" : user.Roll
      });
    }catch(e) {
      print(e.toString());
    }
    return retval;
  }


}