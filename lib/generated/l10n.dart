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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `create an account `
  String get CreateAccount {
    return Intl.message(
      'create an account ',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get SignIn {
    return Intl.message(
      'Login',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Onboarding1Title {
    return Intl.message(
      'Welcome',
      name: 'Onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `We make it easier for you to book an appointment with the right hospital doctor from your home without having to wait or call.`
  String get Onboarding1Desc {
    return Intl.message(
      'We make it easier for you to book an appointment with the right hospital doctor from your home without having to wait or call.',
      name: 'Onboarding1Desc',
      desc: '',
      args: [],
    );
  }

  /// `A healthy journey begins with one step!`
  String get Onboarding2Title {
    return Intl.message(
      'A healthy journey begins with one step!',
      name: 'Onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `We believe in the importance of your health and strive to facilitate your therapeutic journey. The app offers you the possibility to book an appointment with the right hospital doctor from your home easily and quickly.`
  String get Onboarding2Desc {
    return Intl.message(
      'We believe in the importance of your health and strive to facilitate your therapeutic journey. The app offers you the possibility to book an appointment with the right hospital doctor from your home easily and quickly.',
      name: 'Onboarding2Desc',
      desc: '',
      args: [],
    );
  }

  /// `Book your appointment in seconds`
  String get Onboarding3Title {
    return Intl.message(
      'Book your appointment in seconds',
      name: 'Onboarding3Title',
      desc: '',
      args: [],
    );
  }

  /// `With our app, waiting in hospital queues or phoning to book an appointment is no longer necessary. At the click of a button, you can book an appointment with your favorite doctor at a time that suits you.`
  String get Onboarding3Desc {
    return Intl.message(
      'With our app, waiting in hospital queues or phoning to book an appointment is no longer necessary. At the click of a button, you can book an appointment with your favorite doctor at a time that suits you.',
      name: 'Onboarding3Desc',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get Doctor {
    return Intl.message(
      'Doctor',
      name: 'Doctor',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get Patient {
    return Intl.message(
      'Patient',
      name: 'Patient',
      desc: '',
      args: [],
    );
  }

  /// `full name`
  String get FullName {
    return Intl.message(
      'full name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `The Password`
  String get Password {
    return Intl.message(
      'The Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get PhoneNumber {
    return Intl.message(
      'Phone',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Special`
  String get Specialist {
    return Intl.message(
      'Special',
      name: 'Specialist',
      desc: '',
      args: [],
    );
  }

  /// `Please select the specialist`
  String get SpecialWarnning {
    return Intl.message(
      'Please select the specialist',
      name: 'SpecialWarnning',
      desc: '',
      args: [],
    );
  }

  /// `Qualification`
  String get Qualification {
    return Intl.message(
      'Qualification',
      name: 'Qualification',
      desc: '',
      args: [],
    );
  }

  /// `license`
  String get License {
    return Intl.message(
      'license',
      name: 'License',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Age {
    return Intl.message(
      'Age',
      name: 'Age',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get CreateTheAccount {
    return Intl.message(
      'Create Account',
      name: 'CreateTheAccount',
      desc: '',
      args: [],
    );
  }

  /// ` You already have an account!`
  String get AlreadyHaveAccount {
    return Intl.message(
      ' You already have an account!',
      name: 'AlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `sign in`
  String get SignInNow {
    return Intl.message(
      'sign in',
      name: 'SignInNow',
      desc: '',
      args: [],
    );
  }

  /// `You don't have an account!`
  String get HaveAccount {
    return Intl.message(
      'You don\'t have an account!',
      name: 'HaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get CreateNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'CreateNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Dental`
  String get Dental {
    return Intl.message(
      'Dental',
      name: 'Dental',
      desc: '',
      args: [],
    );
  }

  /// `Dermatologist`
  String get Dermatologist {
    return Intl.message(
      'Dermatologist',
      name: 'Dermatologist',
      desc: '',
      args: [],
    );
  }

  /// `Heart`
  String get Heart {
    return Intl.message(
      'Heart',
      name: 'Heart',
      desc: '',
      args: [],
    );
  }

  /// `General Surgery`
  String get GeneralSurgery {
    return Intl.message(
      'General Surgery',
      name: 'GeneralSurgery',
      desc: '',
      args: [],
    );
  }

  /// `The email doesn't have to be empty.`
  String get EmailEmptyValidation {
    return Intl.message(
      'The email doesn\'t have to be empty.',
      name: 'EmailEmptyValidation',
      desc: '',
      args: [],
    );
  }

  /// `The email syntax is incorrect`
  String get EmailValidationSyntaxError {
    return Intl.message(
      'The email syntax is incorrect',
      name: 'EmailValidationSyntaxError',
      desc: '',
      args: [],
    );
  }

  /// `Phone number should contain 9 digits`
  String get PhoneNumberValidation {
    return Intl.message(
      'Phone number should contain 9 digits',
      name: 'PhoneNumberValidation',
      desc: '',
      args: [],
    );
  }

  /// ` Password length should be greater than 6 `
  String get PasswordValidation {
    return Intl.message(
      ' Password length should be greater than 6 ',
      name: 'PasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `close the application`
  String get CloseApp {
    return Intl.message(
      'close the application',
      name: 'CloseApp',
      desc: '',
      args: [],
    );
  }

  /// `Are You Sure!`
  String get AreYouSure {
    return Intl.message(
      'Are You Sure!',
      name: 'AreYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `User Type`
  String get UserTtpe {
    return Intl.message(
      'User Type',
      name: 'UserTtpe',
      desc: '',
      args: [],
    );
  }

  /// `I'm a `
  String get Me {
    return Intl.message(
      'I\'m a ',
      name: 'Me',
      desc: '',
      args: [],
    );
  }

  /// `Select The Language`
  String get SelectLanguage {
    return Intl.message(
      'Select The Language',
      name: 'SelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get Doctors {
    return Intl.message(
      'Doctors',
      name: 'Doctors',
      desc: '',
      args: [],
    );
  }

  /// `Consultations`
  String get Consultations {
    return Intl.message(
      'Consultations',
      name: 'Consultations',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get Appointments {
    return Intl.message(
      'Appointments',
      name: 'Appointments',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Hello ,`
  String get Hello {
    return Intl.message(
      'Hello ,',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Let's search for a doctor`
  String get LtFndDoctor {
    return Intl.message(
      'Let\'s search for a doctor',
      name: 'LtFndDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Departments`
  String get Dept {
    return Intl.message(
      'Departments',
      name: 'Dept',
      desc: '',
      args: [],
    );
  }

  /// `Popular Doctors`
  String get PopularDoctors {
    return Intl.message(
      'Popular Doctors',
      name: 'PopularDoctors',
      desc: '',
      args: [],
    );
  }

  /// `There are no doctors`
  String get NoDoctors {
    return Intl.message(
      'There are no doctors',
      name: 'NoDoctors',
      desc: '',
      args: [],
    );
  }

  /// ` No Data Found`
  String get NoData {
    return Intl.message(
      ' No Data Found',
      name: 'NoData',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get UserName {
    return Intl.message(
      'User Name',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `user@example.com`
  String get EmailLbl {
    return Intl.message(
      'user@example.com',
      name: 'EmailLbl',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get HelpSupport {
    return Intl.message(
      'Help and Support',
      name: 'HelpSupport',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get ShareFriends {
    return Intl.message(
      'Invite Friends',
      name: 'ShareFriends',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get LogOut {
    return Intl.message(
      'Logout',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `You Don't have Appointments`
  String get NoAppointments {
    return Intl.message(
      'You Don\'t have Appointments',
      name: 'NoAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get Reviews {
    return Intl.message(
      'Reviews',
      name: 'Reviews',
      desc: '',
      args: [],
    );
  }

  /// `Going Date:`
  String get GoinDate {
    return Intl.message(
      'Going Date:',
      name: 'GoinDate',
      desc: '',
      args: [],
    );
  }

  /// `About:`
  String get About {
    return Intl.message(
      'About:',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Doctor Info`
  String get DrAbout {
    return Intl.message(
      'Doctor Info',
      name: 'DrAbout',
      desc: '',
      args: [],
    );
  }

  /// `Book an Appointment`
  String get BookAppointment {
    return Intl.message(
      'Book an Appointment',
      name: 'BookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get WorkHours {
    return Intl.message(
      'Working Hours',
      name: 'WorkHours',
      desc: '',
      args: [],
    );
  }

  /// `Of`
  String get Of {
    return Intl.message(
      'Of',
      name: 'Of',
      desc: '',
      args: [],
    );
  }

  /// `Patient Reviews `
  String get PatientsReviews {
    return Intl.message(
      'Patient Reviews ',
      name: 'PatientsReviews',
      desc: '',
      args: [],
    );
  }

  /// `Successful Consultations`
  String get SuccessCons {
    return Intl.message(
      'Successful Consultations',
      name: 'SuccessCons',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get Years {
    return Intl.message(
      'Years',
      name: 'Years',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get Experience {
    return Intl.message(
      'Experience',
      name: 'Experience',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get Successful {
    return Intl.message(
      'Successful',
      name: 'Successful',
      desc: '',
      args: [],
    );
  }

  /// `Certificates Obtained`
  String get ObtCertificates {
    return Intl.message(
      'Certificates Obtained',
      name: 'ObtCertificates',
      desc: '',
      args: [],
    );
  }

  /// `Help And Support`
  String get SupportAndHelp {
    return Intl.message(
      'Help And Support',
      name: 'SupportAndHelp',
      desc: '',
      args: [],
    );
  }

  /// `Invite Friends`
  String get InviteFriends {
    return Intl.message(
      'Invite Friends',
      name: 'InviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `Decline`
  String get Decline {
    return Intl.message(
      'Decline',
      name: 'Decline',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get Canceled {
    return Intl.message(
      'Canceled',
      name: 'Canceled',
      desc: '',
      args: [],
    );
  }

  /// `Declined`
  String get Declined {
    return Intl.message(
      'Declined',
      name: 'Declined',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get Upcoming {
    return Intl.message(
      'Upcoming',
      name: 'Upcoming',
      desc: '',
      args: [],
    );
  }

  /// `Your Booking Added Successfully`
  String get SuccessBooking {
    return Intl.message(
      'Your Booking Added Successfully',
      name: 'SuccessBooking',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home Screen`
  String get BackHome {
    return Intl.message(
      'Back To Home Screen',
      name: 'BackHome',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the Appointment`
  String get ConfirmBookin {
    return Intl.message(
      'Confirm the Appointment',
      name: 'ConfirmBookin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
