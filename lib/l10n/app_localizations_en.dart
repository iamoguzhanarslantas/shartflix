// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String welcome(String name) {
    return 'Welcome $name';
  }

  @override
  String get takePhoto => 'Take a photo';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get registrationSuccess => 'Registration successful!';

  @override
  String registrationFailed(String message) {
    return 'Registration failed: $message';
  }

  @override
  String get loginTitle => 'Login';

  @override
  String get loginSubtitle => 'Login with your user information';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get createAccountTitle => 'Create Account';

  @override
  String get createAccountSubtitle =>
      'Register by entering your user information';

  @override
  String get appTitle => 'Shartflix';

  @override
  String get noTitle => 'No Title';

  @override
  String get notAvailable => 'N/A';

  @override
  String get bonusesYouWillReceive => 'Bonuses You Will Receive';

  @override
  String get premiumAccount => 'Premium Account';

  @override
  String get moreMatches => 'More Matches';

  @override
  String get highlighting => 'Highlighting';

  @override
  String get moreLikes => 'More Likes';

  @override
  String id(String idValue) {
    return 'ID: $idValue';
  }

  @override
  String get nameLabel => 'Name:';

  @override
  String get emailLabel => 'Email:';

  @override
  String get selectTokenPackageToUnlock => 'Select a token package to unlock';

  @override
  String get token => 'Token';

  @override
  String get perWeek => 'Per week';

  @override
  String get seeAllTokens => 'See All Tokens';

  @override
  String get continueButton => 'Continue';

  @override
  String get skipButton => 'Skip';

  @override
  String get userAgreementPrefix => 'User agreement ';

  @override
  String get readAndAccept => 'I have read and accept.';

  @override
  String get pleaseReadAgreement => ' Please read this agreement to continue.';

  @override
  String get profileDetail => 'Profile Detail';

  @override
  String get noAccountPrompt => 'Don\'t have an account?';

  @override
  String get registerAction => 'Register';

  @override
  String get uploadPhoto => 'Upload Photo';

  @override
  String get uploadProfilePhotoDescription =>
      'You can upload an image for your profile photo';

  @override
  String get haveAccountPrompt => 'Already have an account?';

  @override
  String get loginAction => 'Login';

  @override
  String get passwordLabel => 'Password';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get loggingIn => 'Logging In...';

  @override
  String get loginButton => 'Login';

  @override
  String get passwordConfirmLabel => 'Confirm Password';

  @override
  String get registerButton => 'Register';

  @override
  String get fullNameEmptyError => 'Full name cannot be empty';

  @override
  String get fullNameMinLengthError =>
      'Full name must be at least 3 characters';

  @override
  String get emailEmptyError => 'Email cannot be empty';

  @override
  String get emailInvalidError => 'Enter a valid email address';

  @override
  String get passwordEmptyError => 'Password cannot be empty';

  @override
  String get passwordMinLengthError => 'Password must be at least 6 characters';

  @override
  String get passwordConfirmEmptyError => 'Confirm password cannot be empty';

  @override
  String get passwordsDoNotMatchError => 'Passwords do not match';

  @override
  String get termsNotAcceptedError => 'You must accept the user agreement.';
}
