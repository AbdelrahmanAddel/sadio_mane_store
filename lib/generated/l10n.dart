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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `العربية`
  String get language {
    return Intl.message('العربية', name: 'language', desc: '', args: []);
  }

  /// `Sadio Mane Store`
  String get app_name {
    return Intl.message(
      'Sadio Mane Store',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome, Please enter your email and get \nstarted.`
  String get welcome {
    return Intl.message(
      'Welcome, Please enter your email and get \nstarted.',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get your_email {
    return Intl.message('Your Email', name: 'your_email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter a valid email`
  String get valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password, not less than 6 characters`
  String get valid_passwrod {
    return Intl.message(
      'Please enter a valid password, not less than 6 characters',
      name: 'valid_passwrod',
      desc: '',
      args: [],
    );
  }

  /// `You have been logged in successfully`
  String get logged_successfully {
    return Intl.message(
      'You have been logged in successfully',
      name: 'logged_successfully',
      desc: '',
      args: [],
    );
  }

  /// `There was an error logging in. Try again`
  String get logged_error {
    return Intl.message(
      'There was an error logging in. Try again',
      name: 'logged_error',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, Please add your information`
  String get sign_up_welcome {
    return Intl.message(
      'Welcome, Please add your information',
      name: 'sign_up_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `You have an account?`
  String get you_have_account {
    return Intl.message(
      'You have an account?',
      name: 'you_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Please enter your full name`
  String get valid_name {
    return Intl.message(
      'Please enter your full name',
      name: 'valid_name',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Your Image Avatar`
  String get valid_pick_image {
    return Intl.message(
      'Please Select Your Image Avatar',
      name: 'valid_pick_image',
      desc: '',
      args: [],
    );
  }

  /// `The image has been uploaded successfully.`
  String get image_uploaded {
    return Intl.message(
      'The image has been uploaded successfully.',
      name: 'image_uploaded',
      desc: '',
      args: [],
    );
  }

  /// `The image has been Deleted.`
  String get image_removed {
    return Intl.message(
      'The image has been Deleted.',
      name: 'image_removed',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Products`
  String get choose_products {
    return Intl.message(
      'Choose Your Products',
      name: 'choose_products',
      desc: '',
      args: [],
    );
  }

  /// `Application Features`
  String get application_features {
    return Intl.message(
      'Application Features',
      name: 'application_features',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_tilte {
    return Intl.message('Language', name: 'language_tilte', desc: '', args: []);
  }

  /// `Do you want to confirm the language change to Arabic?`
  String get change_to_the_language {
    return Intl.message(
      'Do you want to confirm the language change to Arabic?',
      name: 'change_to_the_language',
      desc: '',
      args: [],
    );
  }

  /// `Sure`
  String get sure {
    return Intl.message('Sure', name: 'sure', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Build Version`
  String get build_version {
    return Intl.message(
      'Build Version',
      name: 'build_version',
      desc: '',
      args: [],
    );
  }

  /// `Build Developer`
  String get build_developer {
    return Intl.message(
      'Build Developer',
      name: 'build_developer',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get log_out {
    return Intl.message('Logout', name: 'log_out', desc: '', args: []);
  }

  /// `Do you want log out?`
  String get log_out_from_app {
    return Intl.message(
      'Do you want log out?',
      name: 'log_out_from_app',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `English`
  String get lang_code {
    return Intl.message('English', name: 'lang_code', desc: '', args: []);
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
