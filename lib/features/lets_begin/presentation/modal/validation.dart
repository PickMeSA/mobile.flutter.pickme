
import 'package:flutter_ui_components/flutter_ui_components.dart';

String? validateEmailAddress(String inputEmail) {
  if(inputEmail.isEmptyOrNull)
    return "Email address is required";
  String pattern =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regexp =  RegExp(pattern);
  if(!regexp.hasMatch(inputEmail))
    return "Please enter a valid email address";
}

String? validatePassword(String value) {
  if(value.isEmpty)
    return "Phone number is required";

  if(!RegExp(r'(?=.*?[A-Z])').hasMatch(value))
    return "Password should contain at least one upper case";

  if(!RegExp(r'(?=.*[a-z])').hasMatch(value))
    return "Password should contain at least one lower case";

  if(!RegExp(r'(?=.*?[0-9])').hasMatch(value))
    return "Password should contain at least one digit";

  if(!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value))
    return "Password should contain at least one Special character";

  if(!RegExp(r'.{6,}$').hasMatch(value))
    return "Password Must be at least 8 characters in length";


}

String? validateConfirmPassword(String password1, String password2 ){
  if(password1 != password2)
    return "Passwords do not match";
}