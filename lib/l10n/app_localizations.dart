import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  String get hello;

  String welcome(String name);

  String get takePhoto;

  String get chooseFromGallery;

  String get registrationSuccess;

  String registrationFailed(String message);

  String get loginTitle;

  String get loginSubtitle;

  String get tryAgain;

  String get createAccountTitle;

  String get createAccountSubtitle;

  String get appTitle;

  String get noTitle;

  String get notAvailable;

  String get bonusesYouWillReceive;

  String get premiumAccount;

  String get moreMatches;

  String get highlighting;

  String get moreLikes;

  String id(String idValue);

  String get nameLabel;

  String get emailLabel;

  String get selectTokenPackageToUnlock;

  String get token;

  String get perWeek;

  String get seeAllTokens;

  String get continueButton;

  String get skipButton;

  String get userAgreementPrefix;

  String get readAndAccept;

  String get pleaseReadAgreement;

  String get profileDetail;

  String get noAccountPrompt;

  String get registerAction;

  String get uploadPhoto;

  String get uploadProfilePhotoDescription;

  String get haveAccountPrompt;

  String get loginAction;

  String get passwordLabel;

  String get forgotPassword;

  String get loggingIn;

  String get loginButton;

  String get passwordConfirmLabel;

  String get registerButton;

  String get fullNameEmptyError;

  String get fullNameMinLengthError;

  String get emailEmptyError;

  String get emailInvalidError;

  String get passwordEmptyError;

  String get passwordMinLengthError;

  String get passwordConfirmEmptyError;

  String get passwordsDoNotMatchError;

  String get termsNotAcceptedError;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
