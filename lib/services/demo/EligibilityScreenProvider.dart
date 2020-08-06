import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String _eligibilityMessage = "";
  bool _isEligible;

  void checkEligibility(int age){
    if(age >= 18) eligibleForLicense();
    else notEligibilityForLicense();
  }

  void eligibleForLicense() {
    _eligibilityMessage = "You are eligible to apply for Driving License";
    _isEligible = true;

    notifyListeners();
  }

  void notEligibilityForLicense(){
    _eligibilityMessage = "You are not eligible to apply for Driving License";
    _isEligible = false;

    notifyListeners();
  }

  String get eligibilityMessage => _eligibilityMessage;

  bool get isEligible => _isEligible;
}