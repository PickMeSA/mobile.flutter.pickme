// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Welcome to pickme!`
  String get welcomeTopickme {
    return Intl.message(
      'Welcome to pickme!',
      name: 'welcomeTopickme',
      desc: '',
      args: [],
    );
  }

  /// `Connecting workers and clients`
  String get connectingWorkersAndClients {
    return Intl.message(
      'Connecting workers and clients',
      name: 'connectingWorkersAndClients',
      desc: '',
      args: [],
    );
  }

  /// ` Log in`
  String get loginIn {
    return Intl.message(
      ' Log in',
      name: 'loginIn',
      desc: '',
      args: [],
    );
  }

  /// `New here? Create Account`
  String get newHereCreateAccount {
    return Intl.message(
      'New here? Create Account',
      name: 'newHereCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hi there!`
  String get hiThere {
    return Intl.message(
      'Hi there!',
      name: 'hiThere',
      desc: '',
      args: [],
    );
  }

  /// `First name *`
  String get firstName {
    return Intl.message(
      'First name *',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Surname *`
  String get surname {
    return Intl.message(
      'Surname *',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Phone number *`
  String get phoneNumber {
    return Intl.message(
      'Phone number *',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Email address *`
  String get emailAddress {
    return Intl.message(
      'Email address *',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Passport number *`
  String get passPortNumberA {
    return Intl.message(
      'Passport number *',
      name: 'passPortNumberA',
      desc: '',
      args: [],
    );
  }

  /// `Passport number`
  String get passport {
    return Intl.message(
      'Passport number',
      name: 'passport',
      desc: '',
      args: [],
    );
  }

  /// `ID number *`
  String get idNumber {
    return Intl.message(
      'ID number *',
      name: 'idNumber',
      desc: '',
      args: [],
    );
  }

  /// `*Indicates a required field`
  String get indicatesARequiredField {
    return Intl.message(
      '*Indicates a required field',
      name: 'indicatesARequiredField',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get ccontinue {
    return Intl.message(
      'Continue',
      name: 'ccontinue',
      desc: '',
      args: [],
    );
  }

  /// `Work permit number *`
  String get workPermitNumber {
    return Intl.message(
      'Work permit number *',
      name: 'workPermitNumber',
      desc: '',
      args: [],
    );
  }

  /// `Let’s get you started by creating your account.`
  String get letsGetYouStartedByCreatingYourAccount {
    return Intl.message(
      'Let’s get you started by creating your account.',
      name: 'letsGetYouStartedByCreatingYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `I didn't receive a code`
  String get iDidntReceiveACode {
    return Intl.message(
      'I didn\'t receive a code',
      name: 'iDidntReceiveACode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your OTP`
  String get enterYourOTP {
    return Intl.message(
      'Enter your OTP',
      name: 'enterYourOTP',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a One-Time Pin (OTP) to your number {number}`
  String weveSentaOneTimePine(Object number) {
    return Intl.message(
      'We’ve sent a One-Time Pin (OTP) to your number $number',
      name: 'weveSentaOneTimePine',
      desc: '',
      args: [number],
    );
  }

  /// `Didn't receive a code?`
  String get didntReceiveACode {
    return Intl.message(
      'Didn\'t receive a code?',
      name: 'didntReceiveACode',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter your phone number. If the problem persists, please contact our help centre.`
  String get pleaseReenterYourPhoneNumber {
    return Intl.message(
      'Please re-enter your phone number. If the problem persists, please contact our help centre.',
      name: 'pleaseReenterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Contact help center`
  String get contactHelpCenter {
    return Intl.message(
      'Contact help center',
      name: 'contactHelpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Log in to your account with your phone number and an OTP`
  String get logIntoYourAccountWithYourPhoneNumberAndOtp {
    return Intl.message(
      'Log in to your account with your phone number and an OTP',
      name: 'logIntoYourAccountWithYourPhoneNumberAndOtp',
      desc: '',
      args: [],
    );
  }

  /// `No account? Create one`
  String get noAccountCreateOne {
    return Intl.message(
      'No account? Create one',
      name: 'noAccountCreateOne',
      desc: '',
      args: [],
    );
  }

  /// `+27`
  String get phonePrefix {
    return Intl.message(
      '+27',
      name: 'phonePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}! Let's set up your profile`
  String welcomeLetsSetUpYourProfile(Object name) {
    return Intl.message(
      'Welcome $name! Let\'s set up your profile',
      name: 'welcomeLetsSetUpYourProfile',
      desc: '',
      args: [name],
    );
  }

  /// `What would you like to do?`
  String get whatWouldYouLikeToDo {
    return Intl.message(
      'What would you like to do?',
      name: 'whatWouldYouLikeToDo',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get work {
    return Intl.message(
      'Work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Hire`
  String get hire {
    return Intl.message(
      'Hire',
      name: 'hire',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Step 2`
  String get step2 {
    return Intl.message(
      'Step 2',
      name: 'step2',
      desc: '',
      args: [],
    );
  }

  /// `Tell us about your qualifications`
  String get tellUsAboutYourQualifications {
    return Intl.message(
      'Tell us about your qualifications',
      name: 'tellUsAboutYourQualifications',
      desc: '',
      args: [],
    );
  }

  /// `Qualifications`
  String get qualifications {
    return Intl.message(
      'Qualifications',
      name: 'qualifications',
      desc: '',
      args: [],
    );
  }

  /// `Add a qualification`
  String get addAQualification {
    return Intl.message(
      'Add a qualification',
      name: 'addAQualification',
      desc: '',
      args: [],
    );
  }

  /// `Work experience`
  String get workExperience {
    return Intl.message(
      'Work experience',
      name: 'workExperience',
      desc: '',
      args: [],
    );
  }

  /// `Add work experience`
  String get addWorkExperience {
    return Intl.message(
      'Add work experience',
      name: 'addWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Membership/Award name`
  String get membershipAwardName {
    return Intl.message(
      'Membership/Award name',
      name: 'membershipAwardName',
      desc: '',
      args: [],
    );
  }

  /// `Add membership \nor award`
  String get addMembershipOrAward {
    return Intl.message(
      'Add membership \nor award',
      name: 'addMembershipOrAward',
      desc: '',
      args: [],
    );
  }

  /// `Next Step`
  String get nextStep {
    return Intl.message(
      'Next Step',
      name: 'nextStep',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Qualification type *`
  String get qualificationType {
    return Intl.message(
      'Qualification type *',
      name: 'qualificationType',
      desc: '',
      args: [],
    );
  }

  /// `Issue date *`
  String get issueDate {
    return Intl.message(
      'Issue date *',
      name: 'issueDate',
      desc: '',
      args: [],
    );
  }

  /// `Qualification name *`
  String get qualificationName {
    return Intl.message(
      'Qualification name *',
      name: 'qualificationName',
      desc: '',
      args: [],
    );
  }

  /// `Issuing organisation *`
  String get issuingOrganisations {
    return Intl.message(
      'Issuing organisation *',
      name: 'issuingOrganisations',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Position title *`
  String get positionTitle {
    return Intl.message(
      'Position title *',
      name: 'positionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Company *`
  String get company {
    return Intl.message(
      'Company *',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `I'm currently working in this role`
  String get imCurrentlyWorkingInThisRole {
    return Intl.message(
      'I\'m currently working in this role',
      name: 'imCurrentlyWorkingInThisRole',
      desc: '',
      args: [],
    );
  }

  /// `Start date *`
  String get startDate {
    return Intl.message(
      'Start date *',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End date *`
  String get endDate {
    return Intl.message(
      'End date *',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Industry *`
  String get industry {
    return Intl.message(
      'Industry *',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Photos of work (optional)`
  String get photosOfWorkOptional {
    return Intl.message(
      'Photos of work (optional)',
      name: 'photosOfWorkOptional',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Name *`
  String get name {
    return Intl.message(
      'Name *',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Skills & industry`
  String get skillsAndIndustry {
    return Intl.message(
      'Skills & industry',
      name: 'skillsAndIndustry',
      desc: '',
      args: [],
    );
  }

  /// `Preferred industry *`
  String get preferredIndustry {
    return Intl.message(
      'Preferred industry *',
      name: 'preferredIndustry',
      desc: '',
      args: [],
    );
  }

  /// `Skills (max. 5)`
  String get skillsMax5 {
    return Intl.message(
      'Skills (max. 5)',
      name: 'skillsMax5',
      desc: '',
      args: [],
    );
  }

  /// `Add a skill`
  String get addASkill {
    return Intl.message(
      'Add a skill',
      name: 'addASkill',
      desc: '',
      args: [],
    );
  }

  /// `Step 3`
  String get step3 {
    return Intl.message(
      'Step 3',
      name: 'step3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
