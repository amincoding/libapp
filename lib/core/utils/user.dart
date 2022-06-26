import 'package:cloud_firestore/cloud_firestore.dart';

class ourUser{

  late String uid;
  late String email;
  late String FullName;
  late Timestamp accountCreated;
  late String Roll;
   ourUser({
    required this.uid,
    required this.email,
    required this.FullName,
    required this.accountCreated,
    required this.Roll
});
}