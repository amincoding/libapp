import 'package:flutter/material.dart';

class ModelHUD extends ChangeNotifier{
  bool isLoading = false;

  changeIsLoading(bool value){
    isLoading = value;
    notifyListeners();
  }
}