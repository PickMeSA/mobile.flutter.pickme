
  import 'package:flutter_ui_components/flutter_ui_components.dart';

bool isPasswordValid(String inputPassword){
  return true;
  }

  String? validateEmailAddress(String inputEmail) {
  if(inputEmail.isEmptyOrNull)
    return "Email address is required";
    String pattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regexp =  RegExp(pattern);
    if(!regexp.hasMatch(inputEmail))
      return "Please enter a valid email address";
  }

  String? validatePhoneNumber(String value) {
    if(value.isEmpty)
      return "Phone number is required";
    String pattern =
        r'^\[0-9]{9}$';
    RegExp regex =  RegExp(pattern);
    if(!regex.hasMatch(value))
      return "Please enter a valid phone number";

  }

  String? validateName(String value){
  if(value.isEmptyOrNull)
    return "First name is required";
  }

  String? validateSurname(String value){
  if(value.isEmptyOrNull)
    return "Surname is required";
  }

  String? validateIdNumber(String value){
  if(!value.isEmptyOrNull){
    if(value.length != 13){
      return "Please enter a valid ID number";
    }
  }
  }
  
  String? validatePassportNumber(String value){
  if(value.isEmptyOrNull)
    return "Passport is required";
  String pattern = r'^\[A|D|M|T][0-9]{8}$';
  RegExp regExp = RegExp(pattern);
  if(!regExp.hasMatch(value))
    return "please enter a valid Passport number";

  }

  String? validateWorkPermitNumber(String value){
  if(value.isEmptyOrNull)
    return "Work permit number is required";
  }
