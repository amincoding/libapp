import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future loginWithGoogle();
  Future loginWithFacebook();
  Future completeInformation(
      {@required String name,
      @required String phoneNumber,
      @required String adress});
}
