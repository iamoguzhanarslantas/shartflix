// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get hello => 'Merhaba';

  @override
  String welcome(String name) {
    return 'Hoş geldin $name';
  }

  @override
  String get takePhoto => 'Fotoğraf Çek';

  @override
  String get chooseFromGallery => 'Galeriden Seç';

  @override
  String get registrationSuccess => 'Kayıt başarılı!';

  @override
  String registrationFailed(String message) {
    return 'Kayıt başarısız: $message';
  }

  @override
  String get loginTitle => 'Giriş Yap';

  @override
  String get loginSubtitle => 'Kullanıcı bilgilerinizle giriş yapın';

  @override
  String get tryAgain => 'Yeniden Dene';

  @override
  String get createAccountTitle => 'Hesap Oluştur';

  @override
  String get createAccountSubtitle =>
      'Kullanıcı bilgilerinizi girerek kaydolun';

  @override
  String get appTitle => 'Shartflix';

  @override
  String get noTitle => 'Başlık Yok';

  @override
  String get notAvailable => 'Mevcut Değil';

  @override
  String get bonusesYouWillReceive => 'Alacağınız Bonuslar';

  @override
  String get premiumAccount => 'Premium Hesap';

  @override
  String get moreMatches => 'Daha Fazla Eşleşme';

  @override
  String get highlighting => 'Öne Çıkarma';

  @override
  String get moreLikes => 'Daha Fazla Beğeni';

  @override
  String id(String idValue) {
    return 'ID: $idValue';
  }

  @override
  String get nameLabel => 'Ad:';

  @override
  String get emailLabel => 'E-posta:';

  @override
  String get selectTokenPackageToUnlock =>
      'Kilidi açmak için bir jeton paketi seçin';

  @override
  String get token => 'Jeton';

  @override
  String get perWeek => 'Haftalık';

  @override
  String get seeAllTokens => 'Tüm Jetonları Gör';

  @override
  String get continueButton => 'Devam Et';

  @override
  String get skipButton => 'Atla';

  @override
  String get userAgreementPrefix => 'Kullanıcı sözleşmesini ';

  @override
  String get readAndAccept => 'Okudum ve Kabul ediyorum.';

  @override
  String get pleaseReadAgreement =>
      ' Lütfen bu sözleşmeyi okuyarak devam ediniz.';

  @override
  String get profileDetail => 'Profil Detayı';

  @override
  String get noAccountPrompt => 'Bir hesabın yok mu?';

  @override
  String get registerAction => 'Kayıt ol';

  @override
  String get uploadPhoto => 'Fotoğraf Yükle';

  @override
  String get uploadProfilePhotoDescription =>
      'Profil fotoğrafınız için görsel yükleyebilirsiniz';

  @override
  String get haveAccountPrompt => 'Hesabın var mı?';

  @override
  String get loginAction => 'Giriş yap';

  @override
  String get passwordLabel => 'Şifre';

  @override
  String get forgotPassword => 'Şifremi unuttum';

  @override
  String get loggingIn => 'Giriş Yapılıyor...';

  @override
  String get loginButton => 'Giriş Yap';

  @override
  String get passwordConfirmLabel => 'Şifre Tekrar';

  @override
  String get registerButton => 'Kaydol';

  @override
  String get fullNameEmptyError => 'Ad Soyad boş bırakılamaz';

  @override
  String get fullNameMinLengthError => 'Ad Soyad en az 3 karakter olmalı';

  @override
  String get emailEmptyError => 'E-posta boş bırakılamaz';

  @override
  String get emailInvalidError => 'Geçerli bir e-posta adresi girin';

  @override
  String get passwordEmptyError => 'Şifre boş bırakılamaz';

  @override
  String get passwordMinLengthError => 'Şifre en az 6 karakter olmalı';

  @override
  String get passwordConfirmEmptyError => 'Şifre tekrar boş bırakılamaz';

  @override
  String get passwordsDoNotMatchError => 'Şifreler eşleşmiyor';

  @override
  String get termsNotAcceptedError =>
      'Kullanıcı sözleşmesini kabul etmelisiniz.';
}
