import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// A greeting message
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// A welcome message with a name parameter
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}'**
  String welcome(String name);

  /// Option to take a photo
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get takePhoto;

  /// Option to choose a photo from gallery
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get chooseFromGallery;

  /// Message for successful registration
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get registrationSuccess;

  /// Message for failed registration with error message
  ///
  /// In en, this message translates to:
  /// **'Registration failed: {message}'**
  String registrationFailed(String message);

  /// Title for login page
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// Subtitle for login page
  ///
  /// In en, this message translates to:
  /// **'Login with your user information'**
  String get loginSubtitle;

  /// Button text to try again
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// Title for create account page
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountTitle;

  /// Subtitle for create account page
  ///
  /// In en, this message translates to:
  /// **'Register by entering your user information'**
  String get createAccountSubtitle;

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Shartflix'**
  String get appTitle;

  /// Placeholder for missing title
  ///
  /// In en, this message translates to:
  /// **'No Title'**
  String get noTitle;

  /// Not available abbreviation
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// Title for bonuses section
  ///
  /// In en, this message translates to:
  /// **'Bonuses You Will Receive'**
  String get bonusesYouWillReceive;

  /// Premium account feature
  ///
  /// In en, this message translates to:
  /// **'Premium Account'**
  String get premiumAccount;

  /// More matches feature
  ///
  /// In en, this message translates to:
  /// **'More Matches'**
  String get moreMatches;

  /// Highlighting feature
  ///
  /// In en, this message translates to:
  /// **'Highlighting'**
  String get highlighting;

  /// More likes feature
  ///
  /// In en, this message translates to:
  /// **'More Likes'**
  String get moreLikes;

  /// User ID display
  ///
  /// In en, this message translates to:
  /// **'ID: {idValue}'**
  String id(String idValue);

  /// Label for name field
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get nameLabel;

  /// Label for email field
  ///
  /// In en, this message translates to:
  /// **'Email:'**
  String get emailLabel;

  /// Instruction for selecting token package
  ///
  /// In en, this message translates to:
  /// **'Select a token package to unlock'**
  String get selectTokenPackageToUnlock;

  /// Token unit
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get token;

  /// Frequency for pricing
  ///
  /// In en, this message translates to:
  /// **'Per week'**
  String get perWeek;

  /// Button to see all tokens
  ///
  /// In en, this message translates to:
  /// **'See All Tokens'**
  String get seeAllTokens;

  /// Continue button text
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Skip button text
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipButton;

  /// Prefix for user agreement text
  ///
  /// In en, this message translates to:
  /// **'User agreement '**
  String get userAgreementPrefix;

  /// User agreement acceptance text
  ///
  /// In en, this message translates to:
  /// **'I have read and accept.'**
  String get readAndAccept;

  /// Instruction to read agreement
  ///
  /// In en, this message translates to:
  /// **' Please read this agreement to continue.'**
  String get pleaseReadAgreement;

  /// Title for profile detail page
  ///
  /// In en, this message translates to:
  /// **'Profile Detail'**
  String get profileDetail;

  /// Prompt for users without an account
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccountPrompt;

  /// Action text to register
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerAction;

  /// Title for photo upload section
  ///
  /// In en, this message translates to:
  /// **'Upload Photo'**
  String get uploadPhoto;

  /// Description for profile photo upload
  ///
  /// In en, this message translates to:
  /// **'You can upload an image for your profile photo'**
  String get uploadProfilePhotoDescription;

  /// Prompt for users with an account
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccountPrompt;

  /// Action text to login
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginAction;

  /// Label for password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// Loading text for login process
  ///
  /// In en, this message translates to:
  /// **'Logging In...'**
  String get loggingIn;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Label for password confirmation field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get passwordConfirmLabel;

  /// Register button text
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerButton;

  /// Error message for empty full name
  ///
  /// In en, this message translates to:
  /// **'Full name cannot be empty'**
  String get fullNameEmptyError;

  /// Error message for full name minimum length
  ///
  /// In en, this message translates to:
  /// **'Full name must be at least 3 characters'**
  String get fullNameMinLengthError;

  /// Error message for empty email
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailEmptyError;

  /// Error message for invalid email format
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get emailInvalidError;

  /// Error message for empty password
  ///
  /// In en, this message translates to:
  /// **'Password cannot be empty'**
  String get passwordEmptyError;

  /// Error message for password minimum length
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLengthError;

  /// Error message for empty password confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirm password cannot be empty'**
  String get passwordConfirmEmptyError;

  /// Error message when passwords do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatchError;

  /// Error message when terms are not accepted
  ///
  /// In en, this message translates to:
  /// **'You must accept the user agreement.'**
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
  // Lookup logic when only language code is specified.
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
