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
  String get passportNumberA {
    return Intl.message(
      'Passport number *',
      name: 'passportNumberA',
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

  /// `Step 1`
  String get step1 {
    return Intl.message(
      'Step 1',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `Select your membership`
  String get selectMembership {
    return Intl.message(
      'Select your membership',
      name: 'selectMembership',
      desc: '',
      args: [],
    );
  }

  /// `once off`
  String get onceOff {
    return Intl.message(
      'once off',
      name: 'onceOff',
      desc: '',
      args: [],
    );
  }

  /// `I have read & accept the`
  String get iHaveReadThe {
    return Intl.message(
      'I have read & accept the',
      name: 'iHaveReadThe',
      desc: '',
      args: [],
    );
  }

  /// `terms & conditions`
  String get termsAndConditions {
    return Intl.message(
      'terms & conditions',
      name: 'termsAndConditions',
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

  /// `Membership`
  String get membership {
    return Intl.message(
      'Membership',
      name: 'membership',
      desc: '',
      args: [],
    );
  }

  /// `The standard Lorem Ipsum passage, used since the 1500s\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."\n\nSection 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"\n\n1914 translation by H. Rackham\n"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"\n\nSection 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."`
  String get longDemoText {
    return Intl.message(
      'The standard Lorem Ipsum passage, used since the 1500s\n"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."\n\nSection 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"\n\n1914 translation by H. Rackham\n"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"\n\nSection 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC\n"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."',
      name: 'longDemoText',
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

  /// `Qualifications / Membership`
  String get qualificationMembership {
    return Intl.message(
      'Qualifications / Membership',
      name: 'qualificationMembership',
      desc: '',
      args: [],
    );
  }

  /// `Add a qualification / membership`
  String get addAQualificationMembership {
    return Intl.message(
      'Add a qualification / membership',
      name: 'addAQualificationMembership',
      desc: '',
      args: [],
    );
  }

  /// `Add a qualification or membership`
  String get addAQualificationOrMembership {
    return Intl.message(
      'Add a qualification or membership',
      name: 'addAQualificationOrMembership',
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

  /// `My Job Requests`
  String get myJobRequests {
    return Intl.message(
      'My Job Requests',
      name: 'myJobRequests',
      desc: '',
      args: [],
    );
  }

  /// `Photos of work`
  String get photosOfWork {
    return Intl.message(
      'Photos of work',
      name: 'photosOfWork',
      desc: '',
      args: [],
    );
  }

  /// `Skills *`
  String get skillsA {
    return Intl.message(
      'Skills *',
      name: 'skillsA',
      desc: '',
      args: [],
    );
  }

  /// `Explore all jobs`
  String get exploreAllJobs {
    return Intl.message(
      'Explore all jobs',
      name: 'exploreAllJobs',
      desc: '',
      args: [],
    );
  }

  /// `Explore all services`
  String get exploreAllServices {
    return Intl.message(
      'Explore all services',
      name: 'exploreAllServices',
      desc: '',
      args: [],
    );
  }

  /// `My job listings`
  String get myJobListings {
    return Intl.message(
      'My job listings',
      name: 'myJobListings',
      desc: '',
      args: [],
    );
  }

  /// `My saved jobs`
  String get mySavedJobs {
    return Intl.message(
      'My saved jobs',
      name: 'mySavedJobs',
      desc: '',
      args: [],
    );
  }

  /// `Recommended for you`
  String get recommendedForYou {
    return Intl.message(
      'Recommended for you',
      name: 'recommendedForYou',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `In your area`
  String get inYourArea {
    return Intl.message(
      'In your area',
      name: 'inYourArea',
      desc: '',
      args: [],
    );
  }

  /// `All services`
  String get allServices {
    return Intl.message(
      'All services',
      name: 'allServices',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for?`
  String get whatAreYouLookingFor {
    return Intl.message(
      'What are you looking for?',
      name: 'whatAreYouLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Location/area based on profile`
  String get locationAreaBasedOnProfile {
    return Intl.message(
      'Location/area based on profile',
      name: 'locationAreaBasedOnProfile',
      desc: '',
      args: [],
    );
  }

  /// `Browse categories`
  String get browseCategories {
    return Intl.message(
      'Browse categories',
      name: 'browseCategories',
      desc: '',
      args: [],
    );
  }

  /// `view Profile`
  String get viewProfile {
    return Intl.message(
      'view Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Service category`
  String get serviceCategory {
    return Intl.message(
      'Service category',
      name: 'serviceCategory',
      desc: '',
      args: [],
    );
  }

  /// `Load more`
  String get loadMore {
    return Intl.message(
      'Load more',
      name: 'loadMore',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Max. distance`
  String get maxDistance {
    return Intl.message(
      'Max. distance',
      name: 'maxDistance',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Apply filters`
  String get applyFilters {
    return Intl.message(
      'Apply filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Possible price range`
  String get possiblePriceRange {
    return Intl.message(
      'Possible price range',
      name: 'possiblePriceRange',
      desc: '',
      args: [],
    );
  }

  /// `Candidate rating`
  String get candidateRating {
    return Intl.message(
      'Candidate rating',
      name: 'candidateRating',
      desc: '',
      args: [],
    );
  }

  /// `I understand`
  String get iUnderstand {
    return Intl.message(
      'I understand',
      name: 'iUnderstand',
      desc: '',
      args: [],
    );
  }

  /// `Your profile is still pending`
  String get yourProfileIsStillPending {
    return Intl.message(
      'Your profile is still pending',
      name: 'yourProfileIsStillPending',
      desc: '',
      args: [],
    );
  }

  /// `Active listings`
  String get activeListings {
    return Intl.message(
      'Active listings',
      name: 'activeListings',
      desc: '',
      args: [],
    );
  }

  /// `Inactive listings`
  String get inactiveListings {
    return Intl.message(
      'Inactive listings',
      name: 'inactiveListings',
      desc: '',
      args: [],
    );
  }

  /// `Create a new job listing`
  String get createANewJobListing {
    return Intl.message(
      'Create a new job listing',
      name: 'createANewJobListing',
      desc: '',
      args: [],
    );
  }

  /// `Create a job listing`
  String get createAJobListing {
    return Intl.message(
      'Create a job listing',
      name: 'createAJobListing',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any active listings`
  String get youDontHaveAnyActiveListings {
    return Intl.message(
      'You don\'t have any active listings',
      name: 'youDontHaveAnyActiveListings',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any active listings`
  String get youDontHaveAnyInactiveListings {
    return Intl.message(
      'You don\'t have any active listings',
      name: 'youDontHaveAnyInactiveListings',
      desc: '',
      args: [],
    );
  }

  /// `We’re still busy verifying your information. On ce verified, you can start posting jobs & hiring candidates.`
  String get weAreStillVerifyingYourAccount {
    return Intl.message(
      'We’re still busy verifying your information. On ce verified, you can start posting jobs & hiring candidates.',
      name: 'weAreStillVerifyingYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Step 4`
  String get step4 {
    return Intl.message(
      'Step 4',
      name: 'step4',
      desc: '',
      args: [],
    );
  }

  /// `What is your hourly rate & work times?`
  String get whatIsYourHourlyRateAndWorkTimes {
    return Intl.message(
      'What is your hourly rate & work times?',
      name: 'whatIsYourHourlyRateAndWorkTimes',
      desc: '',
      args: [],
    );
  }

  /// `Hourly rate`
  String get hourlyRate {
    return Intl.message(
      'Hourly rate',
      name: 'hourlyRate',
      desc: '',
      args: [],
    );
  }

  /// `R`
  String get r {
    return Intl.message(
      'R',
      name: 'r',
      desc: '',
      args: [],
    );
  }

  /// `0.00`
  String get noAmount {
    return Intl.message(
      '0.00',
      name: 'noAmount',
      desc: '',
      args: [],
    );
  }

  /// `Working hours`
  String get workingHours {
    return Intl.message(
      'Working hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Start time *`
  String get startTime {
    return Intl.message(
      'Start time *',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End time *`
  String get endTime {
    return Intl.message(
      'End time *',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Working days`
  String get workingDays {
    return Intl.message(
      'Working days',
      name: 'workingDays',
      desc: '',
      args: [],
    );
  }

  /// `Working days *`
  String get workingDaysA {
    return Intl.message(
      'Working days *',
      name: 'workingDaysA',
      desc: '',
      args: [],
    );
  }

  /// `Subscription fee`
  String get subscriptionFee {
    return Intl.message(
      'Subscription fee',
      name: 'subscriptionFee',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get individual {
    return Intl.message(
      'Individual',
      name: 'individual',
      desc: '',
      args: [],
    );
  }

  /// `Looking for job opportunities as a single individual?`
  String get lookingForJobOpportunitiesAsASingleIndividual {
    return Intl.message(
      'Looking for job opportunities as a single individual?',
      name: 'lookingForJobOpportunitiesAsASingleIndividual',
      desc: '',
      args: [],
    );
  }

  /// `Registration fee`
  String get registrationFee {
    return Intl.message(
      'Registration fee',
      name: 'registrationFee',
      desc: '',
      args: [],
    );
  }

  /// `A one-time fee of R50.00 (including VAT) get you started, with no monthly charges.`
  String get aOneTimeFeeOf500GetYouStarted {
    return Intl.message(
      'A one-time fee of R50.00 (including VAT) get you started, with no monthly charges.',
      name: 'aOneTimeFeeOf500GetYouStarted',
      desc: '',
      args: [],
    );
  }

  /// `You have the flexibility to set your own hourly rate`
  String get youHaveTheFlexibilityToSetYourOwnHourlyRate {
    return Intl.message(
      'You have the flexibility to set your own hourly rate',
      name: 'youHaveTheFlexibilityToSetYourOwnHourlyRate',
      desc: '',
      args: [],
    );
  }

  /// `Additional information`
  String get additionalInformation {
    return Intl.message(
      'Additional information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `At PickMe, we add additional costs to your rate to cover essential aspects:`
  String get atPickMeWeAddAdditionalCostsToYourRateToCoverEssentialAspects {
    return Intl.message(
      'At PickMe, we add additional costs to your rate to cover essential aspects:',
      name: 'atPickMeWeAddAdditionalCostsToYourRateToCoverEssentialAspects',
      desc: '',
      args: [],
    );
  }

  /// `Investment fund`
  String get investmentFund {
    return Intl.message(
      'Investment fund',
      name: 'investmentFund',
      desc: '',
      args: [],
    );
  }

  /// `PickMe invests a R4/hr worked in a personal investment fund for your future.`
  String get pickMeInvestsR4hrWorkedInAProfessionalInvestmentFundForYourFuture {
    return Intl.message(
      'PickMe invests a R4/hr worked in a personal investment fund for your future.',
      name: 'pickMeInvestsR4hrWorkedInAProfessionalInvestmentFundForYourFuture',
      desc: '',
      args: [],
    );
  }

  /// `Transaction fees`
  String get transactionFees {
    return Intl.message(
      'Transaction fees',
      name: 'transactionFees',
      desc: '',
      args: [],
    );
  }

  /// `PickMe Receives a R2/hr worked as services fees`
  String get pickMeReceivesAR2hrWorkedAsServiceFees {
    return Intl.message(
      'PickMe Receives a R2/hr worked as services fees',
      name: 'pickMeReceivesAR2hrWorkedAsServiceFees',
      desc: '',
      args: [],
    );
  }

  /// `Minimum Wage`
  String get minimumWage {
    return Intl.message(
      'Minimum Wage',
      name: 'minimumWage',
      desc: '',
      args: [],
    );
  }

  /// `South African Minimum Wage`
  String get southAfricanMinimumWage {
    return Intl.message(
      'South African Minimum Wage',
      name: 'southAfricanMinimumWage',
      desc: '',
      args: [],
    );
  }

  /// `EPWP`
  String get ePWP {
    return Intl.message(
      'EPWP',
      name: 'ePWP',
      desc: '',
      args: [],
    );
  }

  /// `We set out the minimum loans for each province as a guideline to set up your hourly rate and not to undersell yourself.\n\nPlease note that you cannot set an hourly rate that is less than the lowest minimum wage at R25.42 p/hour.\n\nAs of the 01 March 2023 the Department of Employment and Labor has declared the minimum wage in South Africa to be no less than R25.42p/hr.`
  String get minimumWageText1 {
    return Intl.message(
      'We set out the minimum loans for each province as a guideline to set up your hourly rate and not to undersell yourself.\n\nPlease note that you cannot set an hourly rate that is less than the lowest minimum wage at R25.42 p/hour.\n\nAs of the 01 March 2023 the Department of Employment and Labor has declared the minimum wage in South Africa to be no less than R25.42p/hr.',
      name: 'minimumWageText1',
      desc: '',
      args: [],
    );
  }

  /// `Job name`
  String get jobName {
    return Intl.message(
      'Job name',
      name: 'jobName',
      desc: '',
      args: [],
    );
  }

  /// `Job description`
  String get jobDescription {
    return Intl.message(
      'Job description',
      name: 'jobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Photos (optional)`
  String get photosOptional {
    return Intl.message(
      'Photos (optional)',
      name: 'photosOptional',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get dateTime {
    return Intl.message(
      'Date & Time',
      name: 'dateTime',
      desc: '',
      args: [],
    );
  }

  /// `I am flexible (open to discuss)`
  String get iAmFlexibleOpenToDiscuss {
    return Intl.message(
      'I am flexible (open to discuss)',
      name: 'iAmFlexibleOpenToDiscuss',
      desc: '',
      args: [],
    );
  }

  /// `hours & total fee`
  String get hoursTotalFee {
    return Intl.message(
      'hours & total fee',
      name: 'hoursTotalFee',
      desc: '',
      args: [],
    );
  }

  /// `Skills required (max. 5)`
  String get skillsRequiredMax {
    return Intl.message(
      'Skills required (max. 5)',
      name: 'skillsRequiredMax',
      desc: '',
      args: [],
    );
  }

  /// `Est. hours`
  String get estHours {
    return Intl.message(
      'Est. hours',
      name: 'estHours',
      desc: '',
      args: [],
    );
  }

  /// `Total fee`
  String get totalFee {
    return Intl.message(
      'Total fee',
      name: 'totalFee',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Job listing details`
  String get jobListingDetails {
    return Intl.message(
      'Job listing details',
      name: 'jobListingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.\n\n\n`
  String get loremIpsumDescriptionField {
    return Intl.message(
      'Ex. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.\n\n\n',
      name: 'loremIpsumDescriptionField',
      desc: '',
      args: [],
    );
  }

  /// `As per the Department of Employment and Labor Farm workers will earn a minimum in line with the rate, as will domestic workers. However, workers employed in expanded public works programmes will be entitled to a lower rate at R13.97 per hour.`
  String get minimumWageText2 {
    return Intl.message(
      'As per the Department of Employment and Labor Farm workers will earn a minimum in line with the rate, as will domestic workers. However, workers employed in expanded public works programmes will be entitled to a lower rate at R13.97 per hour.',
      name: 'minimumWageText2',
      desc: '',
      args: [],
    );
  }

  /// `Step 5`
  String get step5 {
    return Intl.message(
      'Step 5',
      name: 'step5',
      desc: '',
      args: [],
    );
  }

  /// `Bank details`
  String get bankDetails {
    return Intl.message(
      'Bank details',
      name: 'bankDetails',
      desc: '',
      args: [],
    );
  }

  /// `Bank *`
  String get bankA {
    return Intl.message(
      'Bank *',
      name: 'bankA',
      desc: '',
      args: [],
    );
  }

  /// `Account type *`
  String get accountTypeA {
    return Intl.message(
      'Account type *',
      name: 'accountTypeA',
      desc: '',
      args: [],
    );
  }

  /// `Account number *`
  String get accountNumberA {
    return Intl.message(
      'Account number *',
      name: 'accountNumberA',
      desc: '',
      args: [],
    );
  }

  /// `Branch Code *`
  String get branchCodeA {
    return Intl.message(
      'Branch Code *',
      name: 'branchCodeA',
      desc: '',
      args: [],
    );
  }

  /// `Step 6`
  String get step6 {
    return Intl.message(
      'Step 6',
      name: 'step6',
      desc: '',
      args: [],
    );
  }

  /// `Where are you located?`
  String get whereAreYouLocated {
    return Intl.message(
      'Where are you located?',
      name: 'whereAreYouLocated',
      desc: '',
      args: [],
    );
  }

  /// `Use my current location`
  String get useMyCurrentLocation {
    return Intl.message(
      'Use my current location',
      name: 'useMyCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Step 7`
  String get step7 {
    return Intl.message(
      'Step 7',
      name: 'step7',
      desc: '',
      args: [],
    );
  }

  /// `Final details`
  String get finalDetails {
    return Intl.message(
      'Final details',
      name: 'finalDetails',
      desc: '',
      args: [],
    );
  }

  /// `About you (based on your profile)`
  String get aboutYouBasedOnYourProfile {
    return Intl.message(
      'About you (based on your profile)',
      name: 'aboutYouBasedOnYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Police clearance (optional)`
  String get policeClearanceOptional {
    return Intl.message(
      'Police clearance (optional)',
      name: 'policeClearanceOptional',
      desc: '',
      args: [],
    );
  }

  /// `Create profile`
  String get createProfile {
    return Intl.message(
      'Create profile',
      name: 'createProfile',
      desc: '',
      args: [],
    );
  }

  /// `You're all set up!`
  String get youAreAllSetup {
    return Intl.message(
      'You\'re all set up!',
      name: 'youAreAllSetup',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been successfully submitted to the PickMe administrators. \n\nYour information needs to be verified before you can start to apply or accept jobs. You will be notified within 00 business days.`
  String get yourProfileHasBeenSuccessfullySubmittedToThePickMeAdministrators {
    return Intl.message(
      'Your profile has been successfully submitted to the PickMe administrators. \n\nYour information needs to be verified before you can start to apply or accept jobs. You will be notified within 00 business days.',
      name: 'yourProfileHasBeenSuccessfullySubmittedToThePickMeAdministrators',
      desc: '',
      args: [],
    );
  }

  /// `Go to dashboard`
  String get goToDashboard {
    return Intl.message(
      'Go to dashboard',
      name: 'goToDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Please enter qualification name`
  String get pleaseEnterQualificationName {
    return Intl.message(
      'Please enter qualification name',
      name: 'pleaseEnterQualificationName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter issuing organization`
  String get pleaseEnterIssuingOrganization {
    return Intl.message(
      'Please enter issuing organization',
      name: 'pleaseEnterIssuingOrganization',
      desc: '',
      args: [],
    );
  }

  /// `Please enter issue date`
  String get pleaseSelectIssueDate {
    return Intl.message(
      'Please enter issue date',
      name: 'pleaseSelectIssueDate',
      desc: '',
      args: [],
    );
  }

  /// `Please enter qualification type`
  String get pleaseEnterQualificationType {
    return Intl.message(
      'Please enter qualification type',
      name: 'pleaseEnterQualificationType',
      desc: '',
      args: [],
    );
  }

  /// `Please enter position title`
  String get pleaseEnterPositionTitle {
    return Intl.message(
      'Please enter position title',
      name: 'pleaseEnterPositionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter company name`
  String get pleaseEnterCompanyName {
    return Intl.message(
      'Please enter company name',
      name: 'pleaseEnterCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Please select start date`
  String get pleaseSelectStartDate {
    return Intl.message(
      'Please select start date',
      name: 'pleaseSelectStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select end date`
  String get pleaseSelectEndDate {
    return Intl.message(
      'Please select end date',
      name: 'pleaseSelectEndDate',
      desc: '',
      args: [],
    );
  }

  /// `End date cannot be before start date`
  String get endDateCannotBeBeforeStartDate {
    return Intl.message(
      'End date cannot be before start date',
      name: 'endDateCannotBeBeforeStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select industry`
  String get pleaseSelectIndustry {
    return Intl.message(
      'Please select industry',
      name: 'pleaseSelectIndustry',
      desc: '',
      args: [],
    );
  }

  /// `I'm flexible (open to discuss)`
  String get iMFlexibleOpenToDiscuss {
    return Intl.message(
      'I\'m flexible (open to discuss)',
      name: 'iMFlexibleOpenToDiscuss',
      desc: '',
      args: [],
    );
  }

  /// `My Bookings`
  String get myBookings {
    return Intl.message(
      'My Bookings',
      name: 'myBookings',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Job Details`
  String get jobDetails {
    return Intl.message(
      'Job Details',
      name: 'jobDetails',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get client {
    return Intl.message(
      'Client',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `Hours & total fee`
  String get hoursAndTotalFee {
    return Intl.message(
      'Hours & total fee',
      name: 'hoursAndTotalFee',
      desc: '',
      args: [],
    );
  }

  /// `R00.00`
  String get r00 {
    return Intl.message(
      'R00.00',
      name: 'r00',
      desc: '',
      args: [],
    );
  }

  /// `Accept & continue`
  String get acceptAndContinue {
    return Intl.message(
      'Accept & continue',
      name: 'acceptAndContinue',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Choose pickup point`
  String get choosePickupPoint {
    return Intl.message(
      'Choose pickup point',
      name: 'choosePickupPoint',
      desc: '',
      args: [],
    );
  }

  /// `Review job listing`
  String get reviewJobListing {
    return Intl.message(
      'Review job listing',
      name: 'reviewJobListing',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Publish listing`
  String get publishListing {
    return Intl.message(
      'Publish listing',
      name: 'publishListing',
      desc: '',
      args: [],
    );
  }

  /// `Your next appointment`
  String get yourNextAppointment {
    return Intl.message(
      'Your next appointment',
      name: 'yourNextAppointment',
      desc: '',
      args: [],
    );
  }

  /// `For you`
  String get forYou {
    return Intl.message(
      'For you',
      name: 'forYou',
      desc: '',
      args: [],
    );
  }

  /// `My Calendar`
  String get myCalendar {
    return Intl.message(
      'My Calendar',
      name: 'myCalendar',
      desc: '',
      args: [],
    );
  }

  /// `My Wallet`
  String get myWallet {
    return Intl.message(
      'My Wallet',
      name: 'myWallet',
      desc: '',
      args: [],
    );
  }

  /// `Need an \nambulance?`
  String get needAnAmbulance {
    return Intl.message(
      'Need an \nambulance?',
      name: 'needAnAmbulance',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {name} {surname}`
  String hi(Object name, Object surname) {
    return Intl.message(
      'Hi, $name $surname',
      name: 'hi',
      desc: '',
      args: [name, surname],
    );
  }

  /// `I would like to`
  String get iWouldLikeTo {
    return Intl.message(
      'I would like to',
      name: 'iWouldLikeTo',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `I am looking for`
  String get iAmLookingFor {
    return Intl.message(
      'I am looking for',
      name: 'iAmLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.`
  String get exampleText {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      name: 'exampleText',
      desc: '',
      args: [],
    );
  }

  /// `Skills Required`
  String get skillsRequired {
    return Intl.message(
      'Skills Required',
      name: 'skillsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message(
      'Photos',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get dateAndTime {
    return Intl.message(
      'Date & Time',
      name: 'dateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `HH:MM *`
  String get timeFormat {
    return Intl.message(
      'HH:MM *',
      name: 'timeFormat',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY *`
  String get dateFormat {
    return Intl.message(
      'DD/MM/YYYY *',
      name: 'dateFormat',
      desc: '',
      args: [],
    );
  }

  /// `Other comments (optional)`
  String get otherCommentsOptional {
    return Intl.message(
      'Other comments (optional)',
      name: 'otherCommentsOptional',
      desc: '',
      args: [],
    );
  }

  /// `Date of Job`
  String get dateOfJob {
    return Intl.message(
      'Date of Job',
      name: 'dateOfJob',
      desc: '',
      args: [],
    );
  }

  /// `If the start date is set by the client, you cannot edit it. If the date is open for discussion, you can propose a date that you're available`
  String get dateOfJobText {
    return Intl.message(
      'If the start date is set by the client, you cannot edit it. If the date is open for discussion, you can propose a date that you\'re available',
      name: 'dateOfJobText',
      desc: '',
      args: [],
    );
  }

  /// `Send Application`
  String get sendApplication {
    return Intl.message(
      'Send Application',
      name: 'sendApplication',
      desc: '',
      args: [],
    );
  }

  /// `Application sent`
  String get applicationSent {
    return Intl.message(
      'Application sent',
      name: 'applicationSent',
      desc: '',
      args: [],
    );
  }

  /// `We've seen your application to the client. Once accepted, it will appear in your calendar in "My Bookings"`
  String get applicationSenttext {
    return Intl.message(
      'We\'ve seen your application to the client. Once accepted, it will appear in your calendar in "My Bookings"',
      name: 'applicationSenttext',
      desc: '',
      args: [],
    );
  }

  /// `Back to Jobs`
  String get backToJobs {
    return Intl.message(
      'Back to Jobs',
      name: 'backToJobs',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule booking`
  String get rescheduleBooking {
    return Intl.message(
      'Reschedule booking',
      name: 'rescheduleBooking',
      desc: '',
      args: [],
    );
  }

  /// `Cancel booking`
  String get cancelBooking {
    return Intl.message(
      'Cancel booking',
      name: 'cancelBooking',
      desc: '',
      args: [],
    );
  }

  /// `See reviews`
  String get seeReviews {
    return Intl.message(
      'See reviews',
      name: 'seeReviews',
      desc: '',
      args: [],
    );
  }

  /// `Need to reschedule? Select an alternative date and/or time and we'll let your client know.`
  String get needToRescheduleSelectAnAlternativeDate {
    return Intl.message(
      'Need to reschedule? Select an alternative date and/or time and we\'ll let your client know.',
      name: 'needToRescheduleSelectAnAlternativeDate',
      desc: '',
      args: [],
    );
  }

  /// `Reason for reschedule`
  String get reasonForReschedule {
    return Intl.message(
      'Reason for reschedule',
      name: 'reasonForReschedule',
      desc: '',
      args: [],
    );
  }

  /// `Select a reason *`
  String get selectAReason {
    return Intl.message(
      'Select a reason *',
      name: 'selectAReason',
      desc: '',
      args: [],
    );
  }

  /// `Proposed date & time`
  String get proposedDateAndTime {
    return Intl.message(
      'Proposed date & time',
      name: 'proposedDateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule request sent`
  String get rescheduleRequestSent {
    return Intl.message(
      'Reschedule request sent',
      name: 'rescheduleRequestSent',
      desc: '',
      args: [],
    );
  }

  /// `Your reschedule request has been sent to your client. Once they approve, your booking will be updated in your calendar to the proposed date and time.`
  String get yourRescheduleRequestHasBeenSent {
    return Intl.message(
      'Your reschedule request has been sent to your client. Once they approve, your booking will be updated in your calendar to the proposed date and time.',
      name: 'yourRescheduleRequestHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Back to bookings`
  String get backToBooking {
    return Intl.message(
      'Back to bookings',
      name: 'backToBooking',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message(
      'Chat',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Reschedule Request`
  String get rescheduleRequest {
    return Intl.message(
      'Reschedule Request',
      name: 'rescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `A reschedule request has been sent to you, Once you approve, your booking will be updated in your calendar to the proposed date and time`
  String get aRescheduleRequestHasBeenSentToYou {
    return Intl.message(
      'A reschedule request has been sent to you, Once you approve, your booking will be updated in your calendar to the proposed date and time',
      name: 'aRescheduleRequestHasBeenSentToYou',
      desc: '',
      args: [],
    );
  }

  /// `Go to reschedule request`
  String get goToRescheduleRequest {
    return Intl.message(
      'Go to reschedule request',
      name: 'goToRescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `{name} needs to reschedule this booking. You can  approve , provide an alternative date and/or time, or decline this request`
  String needsToRescheduleThisBooking(Object name) {
    return Intl.message(
      '$name needs to reschedule this booking. You can  approve , provide an alternative date and/or time, or decline this request',
      name: 'needsToRescheduleThisBooking',
      desc: '',
      args: [name],
    );
  }

  /// `Other comments`
  String get otherComments {
    return Intl.message(
      'Other comments',
      name: 'otherComments',
      desc: '',
      args: [],
    );
  }

  /// `Propose another time?`
  String get proposeAnotherTime {
    return Intl.message(
      'Propose another time?',
      name: 'proposeAnotherTime',
      desc: '',
      args: [],
    );
  }

  /// `Propose Alternative`
  String get proposeAlternative {
    return Intl.message(
      'Propose Alternative',
      name: 'proposeAlternative',
      desc: '',
      args: [],
    );
  }

  /// `Request approved`
  String get requestAccepted {
    return Intl.message(
      'Request approved',
      name: 'requestAccepted',
      desc: '',
      args: [],
    );
  }

  /// `Request declined`
  String get requestDeclined {
    return Intl.message(
      'Request declined',
      name: 'requestDeclined',
      desc: '',
      args: [],
    );
  }

  /// `You've approved the reschedule request and it has been updated in your calendar.`
  String get youveAcceptedTheRescheduleRequest {
    return Intl.message(
      'You\'ve approved the reschedule request and it has been updated in your calendar.',
      name: 'youveAcceptedTheRescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `You,ve declined the reschedule request. You can still propose an alternative date & time`
  String get youveDeclinedTheRescheduleRequest {
    return Intl.message(
      'You,ve declined the reschedule request. You can still propose an alternative date & time',
      name: 'youveDeclinedTheRescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `Not satisfied with the proposed reschedule date & time? you can propose an alternative`
  String get notSatisfiedWithTheProposedRescheduleDateAndTime {
    return Intl.message(
      'Not satisfied with the proposed reschedule date & time? you can propose an alternative',
      name: 'notSatisfiedWithTheProposedRescheduleDateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Select an alternative Date and/or Time.`
  String get selectAnAlternativeDateAndOrTime {
    return Intl.message(
      'Select an alternative Date and/or Time.',
      name: 'selectAnAlternativeDateAndOrTime',
      desc: '',
      args: [],
    );
  }

  /// `Alternative date & time`
  String get alternativeDateAndTime {
    return Intl.message(
      'Alternative date & time',
      name: 'alternativeDateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `Send alternative`
  String get sendAlternative {
    return Intl.message(
      'Send alternative',
      name: 'sendAlternative',
      desc: '',
      args: [],
    );
  }

  /// `Alternative sent`
  String get alternativeSent {
    return Intl.message(
      'Alternative sent',
      name: 'alternativeSent',
      desc: '',
      args: [],
    );
  }

  /// `We've sent your alternative date and time proposal, you will receive a notification as soon as your proposal has been accepted or rejected`
  String get weveSentYourAlternativeDateAndTimeProposal {
    return Intl.message(
      'We\'ve sent your alternative date and time proposal, you will receive a notification as soon as your proposal has been accepted or rejected',
      name: 'weveSentYourAlternativeDateAndTimeProposal',
      desc: '',
      args: [],
    );
  }

  /// `Alternative reschedule request`
  String get alternativeRescheduleRequest {
    return Intl.message(
      'Alternative reschedule request',
      name: 'alternativeRescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `An Alternative reschedule request has been sent to you. Once you approve, your booking will be updated in your calendar to the proposed date and time.`
  String get anAlternativeRescheduleRequestHasBeenSentToYou {
    return Intl.message(
      'An Alternative reschedule request has been sent to you. Once you approve, your booking will be updated in your calendar to the proposed date and time.',
      name: 'anAlternativeRescheduleRequestHasBeenSentToYou',
      desc: '',
      args: [],
    );
  }

  /// `Go to alternative Request`
  String get goToAlternativeRequest {
    return Intl.message(
      'Go to alternative Request',
      name: 'goToAlternativeRequest',
      desc: '',
      args: [],
    );
  }

  /// `Alternative request`
  String get alternativeRequest {
    return Intl.message(
      'Alternative request',
      name: 'alternativeRequest',
      desc: '',
      args: [],
    );
  }

  /// `{name} sent an alternative request. You can approve, or decline this request`
  String sentAnAlternativeRequest(Object name) {
    return Intl.message(
      '$name sent an alternative request. You can approve, or decline this request',
      name: 'sentAnAlternativeRequest',
      desc: '',
      args: [name],
    );
  }

  /// `Decline`
  String get decline {
    return Intl.message(
      'Decline',
      name: 'decline',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Job listing`
  String get jobListing {
    return Intl.message(
      'Job listing',
      name: 'jobListing',
      desc: '',
      args: [],
    );
  }

  /// `Candidate profile`
  String get candidateProfile {
    return Intl.message(
      'Candidate profile',
      name: 'candidateProfile',
      desc: '',
      args: [],
    );
  }

  /// `About me`
  String get aboutMe {
    return Intl.message(
      'About me',
      name: 'aboutMe',
      desc: '',
      args: [],
    );
  }

  /// `My skills`
  String get mySkills {
    return Intl.message(
      'My skills',
      name: 'mySkills',
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

  /// `Offer a job`
  String get offerAJob {
    return Intl.message(
      'Offer a job',
      name: 'offerAJob',
      desc: '',
      args: [],
    );
  }

  /// `When offering a job to a candidate, you can send an existing listing you’ve created before, or you can create a one-time listing for this specific opportunity.`
  String get whenOfferingAJobToACandidateLongText {
    return Intl.message(
      'When offering a job to a candidate, you can send an existing listing you’ve created before, or you can create a one-time listing for this specific opportunity.',
      name: 'whenOfferingAJobToACandidateLongText',
      desc: '',
      args: [],
    );
  }

  /// `Select an existing job listing`
  String get selectAnExistingJobListing {
    return Intl.message(
      'Select an existing job listing',
      name: 'selectAnExistingJobListing',
      desc: '',
      args: [],
    );
  }

  /// `Create a one-time listing`
  String get createAOneTimeListing {
    return Intl.message(
      'Create a one-time listing',
      name: 'createAOneTimeListing',
      desc: '',
      args: [],
    );
  }

  /// `Send job offer`
  String get sendJobOffer {
    return Intl.message(
      'Send job offer',
      name: 'sendJobOffer',
      desc: '',
      args: [],
    );
  }

  /// `Offer sent!`
  String get offerSentEx {
    return Intl.message(
      'Offer sent!',
      name: 'offerSentEx',
      desc: '',
      args: [],
    );
  }

  /// `Your job offer has been sent. You'll receive a notification once the candidate accepts.`
  String get yourJobOfferHasBeenSent {
    return Intl.message(
      'Your job offer has been sent. You\'ll receive a notification once the candidate accepts.',
      name: 'yourJobOfferHasBeenSent',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get bookings {
    return Intl.message(
      'Bookings',
      name: 'bookings',
      desc: '',
      args: [],
    );
  }

  /// `No jobs found`
  String get noJobsFound {
    return Intl.message(
      'No jobs found',
      name: 'noJobsFound',
      desc: '',
      args: [],
    );
  }

  /// `Other services`
  String get otherServices {
    return Intl.message(
      'Other services',
      name: 'otherServices',
      desc: '',
      args: [],
    );
  }

  /// `No job description`
  String get noJobDescription {
    return Intl.message(
      'No job description',
      name: 'noJobDescription',
      desc: '',
      args: [],
    );
  }

  /// `No profile description`
  String get noProfileDescription {
    return Intl.message(
      'No profile description',
      name: 'noProfileDescription',
      desc: '',
      args: [],
    );
  }

  /// `No ratings yet`
  String get noRating {
    return Intl.message(
      'No ratings yet',
      name: 'noRating',
      desc: '',
      args: [],
    );
  }

  /// `+27`
  String get countryCode {
    return Intl.message(
      '+27',
      name: 'countryCode',
      desc: '',
      args: [],
    );
  }

  /// `800000000`
  String get exampleNumber {
    return Intl.message(
      '800000000',
      name: 'exampleNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid cell number.`
  String get pleaseEnterValidCellNumber {
    return Intl.message(
      'Please enter a valid cell number.',
      name: 'pleaseEnterValidCellNumber',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {name}`
  String HiName(Object name) {
    return Intl.message(
      'Hi, $name',
      name: 'HiName',
      desc: '',
      args: [name],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Need to cancel your booking? Fill in the cancellation form and we'll inform your client.`
  String get needToCancelYourBooking {
    return Intl.message(
      'Need to cancel your booking? Fill in the cancellation form and we\'ll inform your client.',
      name: 'needToCancelYourBooking',
      desc: '',
      args: [],
    );
  }

  /// `Reason for cancellation`
  String get reasonForCancellation {
    return Intl.message(
      'Reason for cancellation',
      name: 'reasonForCancellation',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `My banking details`
  String get myBankingDetails {
    return Intl.message(
      'My banking details',
      name: 'myBankingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Pay someone`
  String get paySomeone {
    return Intl.message(
      'Pay someone',
      name: 'paySomeone',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get paymentSuccessful {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Payment Unsuccessful`
  String get paymentUnsuccessful {
    return Intl.message(
      'Payment Unsuccessful',
      name: 'paymentUnsuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Back to my wallet`
  String get backToMyWallet {
    return Intl.message(
      'Back to my wallet',
      name: 'backToMyWallet',
      desc: '',
      args: [],
    );
  }

  /// `Back to pay someone`
  String get BackToPaySomeone {
    return Intl.message(
      'Back to pay someone',
      name: 'BackToPaySomeone',
      desc: '',
      args: [],
    );
  }

  /// `Your payment was successful`
  String get yourPaymentWasSuccessful {
    return Intl.message(
      'Your payment was successful',
      name: 'yourPaymentWasSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Ooops! Something went wrong with your payment, Please try again`
  String get oopsSomethingWentWrongWithYourPayment {
    return Intl.message(
      'Ooops! Something went wrong with your payment, Please try again',
      name: 'oopsSomethingWentWrongWithYourPayment',
      desc: '',
      args: [],
    );
  }

  /// `Pay now`
  String get payNow {
    return Intl.message(
      'Pay now',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `Edit my banking details`
  String get editMyBankingDetails {
    return Intl.message(
      'Edit my banking details',
      name: 'editMyBankingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect OTP entered. Please enter the correct OPT received.`
  String get incorrectOtpEntered {
    return Intl.message(
      'Incorrect OTP entered. Please enter the correct OPT received.',
      name: 'incorrectOtpEntered',
      desc: '',
      args: [],
    );
  }

  /// `Please note that there is no publication fee associated with each job\nlisting.`
  String get createJobListingInfoPublicationFeeDesc {
    return Intl.message(
      'Please note that there is no publication fee associated with each job\nlisting.',
      name: 'createJobListingInfoPublicationFeeDesc',
      desc: '',
      args: [],
    );
  }

  /// `No address specified`
  String get noAddressSpecified {
    return Intl.message(
      'No address specified',
      name: 'noAddressSpecified',
      desc: '',
      args: [],
    );
  }

  /// `My Reviews`
  String get myReviews {
    return Intl.message(
      'My Reviews',
      name: 'myReviews',
      desc: '',
      args: [],
    );
  }

  /// `You don’t have any reviews yet`
  String get youDontHaveAnyReviewsYet {
    return Intl.message(
      'You don’t have any reviews yet',
      name: 'youDontHaveAnyReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Get reviews to boost your profile and increase your chances of getting hired`
  String get getReviewsToBoostProfile {
    return Intl.message(
      'Get reviews to boost your profile and increase your chances of getting hired',
      name: 'getReviewsToBoostProfile',
      desc: '',
      args: [],
    );
  }

  /// `Request a review`
  String get requestAReview {
    return Intl.message(
      'Request a review',
      name: 'requestAReview',
      desc: '',
      args: [],
    );
  }

  /// `Allow your clients, customers, or co-workers to easily leave a review for you. They can scan the QR code or you can copy and share the link with them.`
  String get allowYourClientsToLeaveAReview {
    return Intl.message(
      'Allow your clients, customers, or co-workers to easily leave a review for you. They can scan the QR code or you can copy and share the link with them.',
      name: 'allowYourClientsToLeaveAReview',
      desc: '',
      args: [],
    );
  }

  /// `Copy link`
  String get copyLink {
    return Intl.message(
      'Copy link',
      name: 'copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `No profiles available for this category`
  String get noProfilesAvailableForThisCategory {
    return Intl.message(
      'No profiles available for this category',
      name: 'noProfilesAvailableForThisCategory',
      desc: '',
      args: [],
    );
  }

  /// `Upload cancelled by user`
  String get uploadCancelledByUser {
    return Intl.message(
      'Upload cancelled by user',
      name: 'uploadCancelledByUser',
      desc: '',
      args: [],
    );
  }

  /// `Edit details`
  String get editDetails {
    return Intl.message(
      'Edit details',
      name: 'editDetails',
      desc: '',
      args: [],
    );
  }

  /// `Edit about me`
  String get editAboutMe {
    return Intl.message(
      'Edit about me',
      name: 'editAboutMe',
      desc: '',
      args: [],
    );
  }

  /// `Personal details`
  String get personalDetails {
    return Intl.message(
      'Personal details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `My location`
  String get myLocation {
    return Intl.message(
      'My location',
      name: 'myLocation',
      desc: '',
      args: [],
    );
  }

  /// `My hourly rate and working hours`
  String get myHourlyRateAndWorkingHours {
    return Intl.message(
      'My hourly rate and working hours',
      name: 'myHourlyRateAndWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `Edit Skills`
  String get editSkills {
    return Intl.message(
      'Edit Skills',
      name: 'editSkills',
      desc: '',
      args: [],
    );
  }

  /// `Edit work experience`
  String get editWorkExperience {
    return Intl.message(
      'Edit work experience',
      name: 'editWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Alternative request declined`
  String get alternativeRequestDeclined {
    return Intl.message(
      'Alternative request declined',
      name: 'alternativeRequestDeclined',
      desc: '',
      args: [],
    );
  }

  /// `Alternative request accepted`
  String get alternativeRequestAccepted {
    return Intl.message(
      'Alternative request accepted',
      name: 'alternativeRequestAccepted',
      desc: '',
      args: [],
    );
  }

  /// `You've approved the Alternative request and it has updated in your calender.`
  String get youveApprovedTheAlternativeRequest {
    return Intl.message(
      'You\'ve approved the Alternative request and it has updated in your calender.',
      name: 'youveApprovedTheAlternativeRequest',
      desc: '',
      args: [],
    );
  }

  /// `You've declined the Alternative request.`
  String get youveDeclinedTheAlternativeRequest {
    return Intl.message(
      'You\'ve declined the Alternative request.',
      name: 'youveDeclinedTheAlternativeRequest',
      desc: '',
      args: [],
    );
  }

  /// `Account holder name`
  String get accountHolderName {
    return Intl.message(
      'Account holder name',
      name: 'accountHolderName',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loadingDotDot {
    return Intl.message(
      'loading...',
      name: 'loadingDotDot',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate`
  String get howWouldYouRate {
    return Intl.message(
      'How would you rate',
      name: 'howWouldYouRate',
      desc: '',
      args: [],
    );
  }

  /// `No industry specified`
  String get noIndustrySpecified {
    return Intl.message(
      'No industry specified',
      name: 'noIndustrySpecified',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Complete booking`
  String get completeBooking {
    return Intl.message(
      'Complete booking',
      name: 'completeBooking',
      desc: '',
      args: [],
    );
  }

  /// `No reviews found`
  String get noReviewsFound {
    return Intl.message(
      'No reviews found',
      name: 'noReviewsFound',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Edit photos of work`
  String get editPhotosOfWork {
    return Intl.message(
      'Edit photos of work',
      name: 'editPhotosOfWork',
      desc: '',
      args: [],
    );
  }

  /// `Certificate`
  String get certificate {
    return Intl.message(
      'Certificate',
      name: 'certificate',
      desc: '',
      args: [],
    );
  }

  /// `Jobs near me`
  String get jobsNearMe {
    return Intl.message(
      'Jobs near me',
      name: 'jobsNearMe',
      desc: '',
      args: [],
    );
  }

  /// `Applied`
  String get applied {
    return Intl.message(
      'Applied',
      name: 'applied',
      desc: '',
      args: [],
    );
  }

  /// `No more than 6 Images can be uploaded for each experience`
  String get noMoreThan6ImagesCanBeUploadedForEachExperience {
    return Intl.message(
      'No more than 6 Images can be uploaded for each experience',
      name: 'noMoreThan6ImagesCanBeUploadedForEachExperience',
      desc: '',
      args: [],
    );
  }

  /// `You've approved the reschedule request and it has updated in your calender.`
  String get youveApprovedTheRescheduleRequest {
    return Intl.message(
      'You\'ve approved the reschedule request and it has updated in your calender.',
      name: 'youveApprovedTheRescheduleRequest',
      desc: '',
      args: [],
    );
  }

  /// `Need support with PickMe? Reach out to our Help Center for assistance.`
  String get needSupporWithPickme {
    return Intl.message(
      'Need support with PickMe? Reach out to our Help Center for assistance.',
      name: 'needSupporWithPickme',
      desc: '',
      args: [],
    );
  }

  /// `Applications`
  String get applications {
    return Intl.message(
      'Applications',
      name: 'applications',
      desc: '',
      args: [],
    );
  }

  /// `You found someone for the job!`
  String get youFoundSomeoneForTheJob {
    return Intl.message(
      'You found someone for the job!',
      name: 'youFoundSomeoneForTheJob',
      desc: '',
      args: [],
    );
  }

  /// `Keep tabs on this job in 'My Bookings'.`
  String get keepTabsOnThisJobInMyBookings {
    return Intl.message(
      'Keep tabs on this job in \'My Bookings\'.',
      name: 'keepTabsOnThisJobInMyBookings',
      desc: '',
      args: [],
    );
  }

  /// `See cancellation details`
  String get seeCancellationDetails {
    return Intl.message(
      'See cancellation details',
      name: 'seeCancellationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation details`
  String get cancellationDetails {
    return Intl.message(
      'Cancellation details',
      name: 'cancellationDetails',
      desc: '',
      args: [],
    );
  }

  /// `{name} cancelled this booking. See details below`
  String cancelledThisBooking(Object name) {
    return Intl.message(
      '$name cancelled this booking. See details below',
      name: 'cancelledThisBooking',
      desc: '',
      args: [name],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Back to pay someone`
  String get backToPaySomeone {
    return Intl.message(
      'Back to pay someone',
      name: 'backToPaySomeone',
      desc: '',
      args: [],
    );
  }

  /// `No, cancel`
  String get noCancel {
    return Intl.message(
      'No, cancel',
      name: 'noCancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes, switch`
  String get yesSwitch {
    return Intl.message(
      'Yes, switch',
      name: 'yesSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Switching profiles`
  String get switchingProfiles {
    return Intl.message(
      'Switching profiles',
      name: 'switchingProfiles',
      desc: '',
      args: [],
    );
  }

  /// `Switching your profile from 'Hiring' to 'Working'. Confirm your choice?`
  String get switchingYourProfileFromHireToWorking {
    return Intl.message(
      'Switching your profile from \'Hiring\' to \'Working\'. Confirm your choice?',
      name: 'switchingYourProfileFromHireToWorking',
      desc: '',
      args: [],
    );
  }

  /// `You're booked for the job!`
  String get youreBookedForTheJob {
    return Intl.message(
      'You\'re booked for the job!',
      name: 'youreBookedForTheJob',
      desc: '',
      args: [],
    );
  }

  /// `You can keep track of this job in 'My Bookings'.`
  String get youCanKeepTrackOfThisJobInMyBookings {
    return Intl.message(
      'You can keep track of this job in \'My Bookings\'.',
      name: 'youCanKeepTrackOfThisJobInMyBookings',
      desc: '',
      args: [],
    );
  }

  /// `Matching profiles`
  String get matchingProfiles {
    return Intl.message(
      'Matching profiles',
      name: 'matchingProfiles',
      desc: '',
      args: [],
    );
  }

  /// `Remove match`
  String get removeMatch {
    return Intl.message(
      'Remove match',
      name: 'removeMatch',
      desc: '',
      args: [],
    );
  }

  /// `Review user`
  String get reviewUser {
    return Intl.message(
      'Review user',
      name: 'reviewUser',
      desc: '',
      args: [],
    );
  }

  /// `Unpublish listing`
  String get unpublishListing {
    return Intl.message(
      'Unpublish listing',
      name: 'unpublishListing',
      desc: '',
      args: [],
    );
  }

  /// `Switching your profile from 'Working' to 'Hiring'. Confirm your choice?`
  String get switchingYourProfileFromWorkerToHire {
    return Intl.message(
      'Switching your profile from \'Working\' to \'Hiring\'. Confirm your choice?',
      name: 'switchingYourProfileFromWorkerToHire',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Later this month`
  String get laterThisMonth {
    return Intl.message(
      'Later this month',
      name: 'laterThisMonth',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get information {
    return Intl.message(
      'Information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `back to setup profile`
  String get backToSetUpProfile {
    return Intl.message(
      'back to setup profile',
      name: 'backToSetUpProfile',
      desc: '',
      args: [],
    );
  }

  /// `You don't have upcoming appointments`
  String get youDontHaveUpcomingAppointments {
    return Intl.message(
      'You don\'t have upcoming appointments',
      name: 'youDontHaveUpcomingAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted`
  String get reviewSubmitted {
    return Intl.message(
      'Review submitted',
      name: 'reviewSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for reviewing this user`
  String get thanksForReviewingThisUser {
    return Intl.message(
      'Thank you for reviewing this user',
      name: 'thanksForReviewingThisUser',
      desc: '',
      args: [],
    );
  }

  /// `Back to dashboard`
  String get backToDashboard {
    return Intl.message(
      'Back to dashboard',
      name: 'backToDashboard',
      desc: '',
      args: [],
    );
  }

  /// `All jobs`
  String get allJobs {
    return Intl.message(
      'All jobs',
      name: 'allJobs',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Delete`
  String get yesDelete {
    return Intl.message(
      'Yes, Delete',
      name: 'yesDelete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you would like to delete your account.`
  String get areYouSureYouWantToDeleteYourAccount {
    return Intl.message(
      'Are you sure you would like to delete your account.',
      name: 'areYouSureYouWantToDeleteYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete account?`
  String get deleteAccountQ {
    return Intl.message(
      'Delete account?',
      name: 'deleteAccountQ',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get present {
    return Intl.message(
      'Present',
      name: 'present',
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
