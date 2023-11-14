// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Welcome ${name}! Let\'s set up your profile";

  static String m1(number) =>
      "We’ve sent a One-Time Pin (OTP) to your number ${number}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "ccontinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "connectingWorkersAndClients": MessageLookupByLibrary.simpleMessage(
            "Connecting workers and clients"),
        "contactHelpCenter":
            MessageLookupByLibrary.simpleMessage("Contact help center"),
        "didntReceiveACode":
            MessageLookupByLibrary.simpleMessage("Didn\'t receive a code?"),
        "emailAddress": MessageLookupByLibrary.simpleMessage("Email address *"),
        "enterYourOTP": MessageLookupByLibrary.simpleMessage("Enter your OTP"),
        "firstName": MessageLookupByLibrary.simpleMessage("First name *"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get Started"),
        "hiThere": MessageLookupByLibrary.simpleMessage("Hi there!"),
        "hire": MessageLookupByLibrary.simpleMessage("Hire"),
        "iDidntReceiveACode":
            MessageLookupByLibrary.simpleMessage("I didn\'t receive a code"),
        "idNumber": MessageLookupByLibrary.simpleMessage("ID number *"),
        "indicatesARequiredField":
            MessageLookupByLibrary.simpleMessage("*Indicates a required field"),
        "letsGetYouStartedByCreatingYourAccount":
            MessageLookupByLibrary.simpleMessage(
                "Let’s get you started by creating your account."),
        "logIntoYourAccountWithYourPhoneNumberAndOtp":
            MessageLookupByLibrary.simpleMessage(
                "Log in to your account with your phone number and an OTP"),
        "loginIn": MessageLookupByLibrary.simpleMessage(" Log in"),
        "newHereCreateAccount":
            MessageLookupByLibrary.simpleMessage("New here? Create Account"),
        "noAccountCreateOne":
            MessageLookupByLibrary.simpleMessage("No account? Create one"),
        "passPortNumberA":
            MessageLookupByLibrary.simpleMessage("Passport number *"),
        "passport": MessageLookupByLibrary.simpleMessage("Passport number"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("Phone number *"),
        "phonePrefix": MessageLookupByLibrary.simpleMessage("+27"),
        "pleaseReenterYourPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please re-enter your phone number. If the problem persists, please contact our help centre."),
        "submit": MessageLookupByLibrary.simpleMessage("Submit"),
        "surname": MessageLookupByLibrary.simpleMessage("Surname *"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome back!"),
        "welcomeLetsSetUpYourProfile": m0,
        "welcomeTopickme":
            MessageLookupByLibrary.simpleMessage("Welcome to pickme!"),
        "weveSentaOneTimePine": m1,
        "whatWouldYouLikeToDo":
            MessageLookupByLibrary.simpleMessage("What would you like to do?"),
        "work": MessageLookupByLibrary.simpleMessage("Work"),
        "workPermitNumber":
            MessageLookupByLibrary.simpleMessage("Work permit number *")
      };
}
