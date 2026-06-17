///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'resources.g.dart';

// Path: <root>
typedef TranslationsTr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// tr: 'Weathernaut'
	String get projectName => TranslationOverrides.string(_root.$meta, 'projectName', {}) ?? 'Weathernaut';

	/// tr: 'Weathernaut'
	String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Weathernaut';

	/// tr: 'Weathernaut'a Hoş Geldiniz'
	String get welcome => TranslationOverrides.string(_root.$meta, 'welcome', {}) ?? 'Weathernaut\'a Hoş Geldiniz';

	late final TranslationsHomeTr home = TranslationsHomeTr._(_root);
	late final TranslationsSearchTr search = TranslationsSearchTr._(_root);
	late final TranslationsSettingsTr settings = TranslationsSettingsTr._(_root);
	late final TranslationsOnboardingTr onboarding = TranslationsOnboardingTr._(_root);
	late final TranslationsAuthTr auth = TranslationsAuthTr._(_root);
	late final TranslationsNewsTr news = TranslationsNewsTr._(_root);
}

// Path: home
class TranslationsHomeTr {
	TranslationsHomeTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Hava Durumu Paneli'
	String get title => TranslationOverrides.string(_root.$meta, 'home.title', {}) ?? 'Hava Durumu Paneli';

	/// tr: 'Nem'
	String get humidity => TranslationOverrides.string(_root.$meta, 'home.humidity', {}) ?? 'Nem';

	/// tr: 'Rüzgar Hızı'
	String get wind => TranslationOverrides.string(_root.$meta, 'home.wind', {}) ?? 'Rüzgar Hızı';

	/// tr: 'Basınç'
	String get pressure => TranslationOverrides.string(_root.$meta, 'home.pressure', {}) ?? 'Basınç';

	/// tr: 'Hissedilen'
	String get feelsLike => TranslationOverrides.string(_root.$meta, 'home.feelsLike', {}) ?? 'Hissedilen';

	/// tr: 'Saatlik Tahmin'
	String get hourlyForecast => TranslationOverrides.string(_root.$meta, 'home.hourlyForecast', {}) ?? 'Saatlik Tahmin';

	/// tr: '7 Günlük Tahmin'
	String get dailyForecast => TranslationOverrides.string(_root.$meta, 'home.dailyForecast', {}) ?? '7 Günlük Tahmin';

	/// tr: 'Bir şehir arayın...'
	String get searchPrompt => TranslationOverrides.string(_root.$meta, 'home.searchPrompt', {}) ?? 'Bir şehir arayın...';
}

// Path: search
class TranslationsSearchTr {
	TranslationsSearchTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Arama'
	String get title => TranslationOverrides.string(_root.$meta, 'search.title', {}) ?? 'Arama';

	/// tr: 'Şehir adı girin...'
	String get placeholder => TranslationOverrides.string(_root.$meta, 'search.placeholder', {}) ?? 'Şehir adı girin...';

	/// tr: 'Şehir bulunamadı'
	String get noResults => TranslationOverrides.string(_root.$meta, 'search.noResults', {}) ?? 'Şehir bulunamadı';

	/// tr: 'Son Aramalar'
	String get recentSearches => TranslationOverrides.string(_root.$meta, 'search.recentSearches', {}) ?? 'Son Aramalar';
}

// Path: settings
class TranslationsSettingsTr {
	TranslationsSettingsTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Ayarlar'
	String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ayarlar';

	/// tr: 'Tema Modu'
	String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Tema Modu';

	/// tr: 'Sistem Varsayılanı'
	String get systemTheme => TranslationOverrides.string(_root.$meta, 'settings.systemTheme', {}) ?? 'Sistem Varsayılanı';

	/// tr: 'Karanlık Mod'
	String get darkMode => TranslationOverrides.string(_root.$meta, 'settings.darkMode', {}) ?? 'Karanlık Mod';

	/// tr: 'Aydınlık Mod'
	String get lightMode => TranslationOverrides.string(_root.$meta, 'settings.lightMode', {}) ?? 'Aydınlık Mod';

	/// tr: 'Sıcaklık Birimi'
	String get units => TranslationOverrides.string(_root.$meta, 'settings.units', {}) ?? 'Sıcaklık Birimi';

	/// tr: 'Santigrat (°C)'
	String get celsius => TranslationOverrides.string(_root.$meta, 'settings.celsius', {}) ?? 'Santigrat (°C)';

	/// tr: 'Fahrenheit (°F)'
	String get fahrenheit => TranslationOverrides.string(_root.$meta, 'settings.fahrenheit', {}) ?? 'Fahrenheit (°F)';

	/// tr: 'Dil'
	String get language => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Dil';

	/// tr: 'English'
	String get english => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English';

	/// tr: 'Türkçe'
	String get turkish => TranslationOverrides.string(_root.$meta, 'settings.turkish', {}) ?? 'Türkçe';

	/// tr: 'Oturumu Kapat'
	String get logout => TranslationOverrides.string(_root.$meta, 'settings.logout', {}) ?? 'Oturumu Kapat';

	/// tr: 'İsmi Güncelle'
	String get updateNameTitle => TranslationOverrides.string(_root.$meta, 'settings.updateNameTitle', {}) ?? 'İsmi Güncelle';

	/// tr: 'Adınız Soyadınız'
	String get updateNameHint => TranslationOverrides.string(_root.$meta, 'settings.updateNameHint', {}) ?? 'Adınız Soyadınız';

	/// tr: 'Kaydet'
	String get save => TranslationOverrides.string(_root.$meta, 'settings.save', {}) ?? 'Kaydet';

	/// tr: 'İptal'
	String get cancel => TranslationOverrides.string(_root.$meta, 'settings.cancel', {}) ?? 'İptal';

	/// tr: 'Profil ismi güncellendi!'
	String get nameUpdated => TranslationOverrides.string(_root.$meta, 'settings.nameUpdated', {}) ?? 'Profil ismi güncellendi!';

	/// tr: 'İsim boş olamaz!'
	String get nameError => TranslationOverrides.string(_root.$meta, 'settings.nameError', {}) ?? 'İsim boş olamaz!';
}

// Path: onboarding
class TranslationsOnboardingTr {
	TranslationsOnboardingTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Geç'
	String get skip => TranslationOverrides.string(_root.$meta, 'onboarding.skip', {}) ?? 'Geç';

	/// tr: 'İleri'
	String get next => TranslationOverrides.string(_root.$meta, 'onboarding.next', {}) ?? 'İleri';

	/// tr: 'Başla'
	String get getStarted => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Başla';

	/// tr: 'Anlık Hava Durumu'
	String get page1Title => TranslationOverrides.string(_root.$meta, 'onboarding.page1Title', {}) ?? 'Anlık Hava Durumu';

	/// tr: 'Dünya genelindeki herhangi bir şehir için doğru hava durumu güncellemelerini alın.'
	String get page1Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page1Desc', {}) ?? 'Dünya genelindeki herhangi bir şehir için doğru hava durumu güncellemelerini alın.';

	/// tr: 'Haftalık Tahmin'
	String get page2Title => TranslationOverrides.string(_root.$meta, 'onboarding.page2Title', {}) ?? 'Haftalık Tahmin';

	/// tr: '7 günlük hava durumu tahminleriyle haftanızı önceden planlayın.'
	String get page2Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page2Desc', {}) ?? '7 günlük hava durumu tahminleriyle haftanızı önceden planlayın.';

	/// tr: 'Şehirlerinizi Kaydedin'
	String get page3Title => TranslationOverrides.string(_root.$meta, 'onboarding.page3Title', {}) ?? 'Şehirlerinizi Kaydedin';

	/// tr: 'Aynı anda birden fazla şehrin hava durumunu takip edin.'
	String get page3Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page3Desc', {}) ?? 'Aynı anda birden fazla şehrin hava durumunu takip edin.';
}

// Path: auth
class TranslationsAuthTr {
	TranslationsAuthTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Tekrar Hoş Geldiniz 👋'
	String get welcomeBack => TranslationOverrides.string(_root.$meta, 'auth.welcomeBack', {}) ?? 'Tekrar Hoş Geldiniz 👋';

	/// tr: 'Devam etmek için giriş yapın'
	String get signInToContinue => TranslationOverrides.string(_root.$meta, 'auth.signInToContinue', {}) ?? 'Devam etmek için giriş yapın';

	/// tr: 'E-posta'
	String get email => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'E-posta';

	/// tr: 'Şifre'
	String get password => TranslationOverrides.string(_root.$meta, 'auth.password', {}) ?? 'Şifre';

	/// tr: 'Şifremi Unuttum?'
	String get forgotPassword => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Şifremi Unuttum?';

	/// tr: 'Giriş Yap'
	String get signIn => TranslationOverrides.string(_root.$meta, 'auth.signIn', {}) ?? 'Giriş Yap';

	/// tr: 'Hesabınız yok mu?'
	String get dontHaveAccount => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Hesabınız yok mu?';

	/// tr: 'Kayıt Ol'
	String get signUp => TranslationOverrides.string(_root.$meta, 'auth.signUp', {}) ?? 'Kayıt Ol';

	/// tr: 'Hesap Oluştur 🌤️'
	String get createAccount => TranslationOverrides.string(_root.$meta, 'auth.createAccount', {}) ?? 'Hesap Oluştur 🌤️';

	/// tr: 'Başlamak için kayıt olun'
	String get signUpToGetStarted => TranslationOverrides.string(_root.$meta, 'auth.signUpToGetStarted', {}) ?? 'Başlamak için kayıt olun';

	/// tr: 'Ad Soyad'
	String get fullName => TranslationOverrides.string(_root.$meta, 'auth.fullName', {}) ?? 'Ad Soyad';

	/// tr: 'Zaten hesabınız var mı?'
	String get alreadyHaveAccount => TranslationOverrides.string(_root.$meta, 'auth.alreadyHaveAccount', {}) ?? 'Zaten hesabınız var mı?';

	/// tr: 'Lütfen tüm alanları doldurun'
	String get errorEmptyFields => TranslationOverrides.string(_root.$meta, 'auth.errorEmptyFields', {}) ?? 'Lütfen tüm alanları doldurun';

	/// tr: 'Lütfen geçerli bir e-posta adresi girin'
	String get errorInvalidEmail => TranslationOverrides.string(_root.$meta, 'auth.errorInvalidEmail', {}) ?? 'Lütfen geçerli bir e-posta adresi girin';

	/// tr: 'Şifre en az 6 karakter olmalıdır'
	String get errorPasswordTooShort => TranslationOverrides.string(_root.$meta, 'auth.errorPasswordTooShort', {}) ?? 'Şifre en az 6 karakter olmalıdır';
}

// Path: news
class TranslationsNewsTr {
	TranslationsNewsTr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// tr: 'Haberler'
	String get title => TranslationOverrides.string(_root.$meta, 'news.title', {}) ?? 'Haberler';

	/// tr: 'Haber bulunamadı'
	String get noNews => TranslationOverrides.string(_root.$meta, 'news.noNews', {}) ?? 'Haber bulunamadı';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'projectName' => TranslationOverrides.string(_root.$meta, 'projectName', {}) ?? 'Weathernaut',
			'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Weathernaut',
			'welcome' => TranslationOverrides.string(_root.$meta, 'welcome', {}) ?? 'Weathernaut\'a Hoş Geldiniz',
			'home.title' => TranslationOverrides.string(_root.$meta, 'home.title', {}) ?? 'Hava Durumu Paneli',
			'home.humidity' => TranslationOverrides.string(_root.$meta, 'home.humidity', {}) ?? 'Nem',
			'home.wind' => TranslationOverrides.string(_root.$meta, 'home.wind', {}) ?? 'Rüzgar Hızı',
			'home.pressure' => TranslationOverrides.string(_root.$meta, 'home.pressure', {}) ?? 'Basınç',
			'home.feelsLike' => TranslationOverrides.string(_root.$meta, 'home.feelsLike', {}) ?? 'Hissedilen',
			'home.hourlyForecast' => TranslationOverrides.string(_root.$meta, 'home.hourlyForecast', {}) ?? 'Saatlik Tahmin',
			'home.dailyForecast' => TranslationOverrides.string(_root.$meta, 'home.dailyForecast', {}) ?? '7 Günlük Tahmin',
			'home.searchPrompt' => TranslationOverrides.string(_root.$meta, 'home.searchPrompt', {}) ?? 'Bir şehir arayın...',
			'search.title' => TranslationOverrides.string(_root.$meta, 'search.title', {}) ?? 'Arama',
			'search.placeholder' => TranslationOverrides.string(_root.$meta, 'search.placeholder', {}) ?? 'Şehir adı girin...',
			'search.noResults' => TranslationOverrides.string(_root.$meta, 'search.noResults', {}) ?? 'Şehir bulunamadı',
			'search.recentSearches' => TranslationOverrides.string(_root.$meta, 'search.recentSearches', {}) ?? 'Son Aramalar',
			'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Ayarlar',
			'settings.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Tema Modu',
			'settings.systemTheme' => TranslationOverrides.string(_root.$meta, 'settings.systemTheme', {}) ?? 'Sistem Varsayılanı',
			'settings.darkMode' => TranslationOverrides.string(_root.$meta, 'settings.darkMode', {}) ?? 'Karanlık Mod',
			'settings.lightMode' => TranslationOverrides.string(_root.$meta, 'settings.lightMode', {}) ?? 'Aydınlık Mod',
			'settings.units' => TranslationOverrides.string(_root.$meta, 'settings.units', {}) ?? 'Sıcaklık Birimi',
			'settings.celsius' => TranslationOverrides.string(_root.$meta, 'settings.celsius', {}) ?? 'Santigrat (°C)',
			'settings.fahrenheit' => TranslationOverrides.string(_root.$meta, 'settings.fahrenheit', {}) ?? 'Fahrenheit (°F)',
			'settings.language' => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Dil',
			'settings.english' => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English',
			'settings.turkish' => TranslationOverrides.string(_root.$meta, 'settings.turkish', {}) ?? 'Türkçe',
			'settings.logout' => TranslationOverrides.string(_root.$meta, 'settings.logout', {}) ?? 'Oturumu Kapat',
			'settings.updateNameTitle' => TranslationOverrides.string(_root.$meta, 'settings.updateNameTitle', {}) ?? 'İsmi Güncelle',
			'settings.updateNameHint' => TranslationOverrides.string(_root.$meta, 'settings.updateNameHint', {}) ?? 'Adınız Soyadınız',
			'settings.save' => TranslationOverrides.string(_root.$meta, 'settings.save', {}) ?? 'Kaydet',
			'settings.cancel' => TranslationOverrides.string(_root.$meta, 'settings.cancel', {}) ?? 'İptal',
			'settings.nameUpdated' => TranslationOverrides.string(_root.$meta, 'settings.nameUpdated', {}) ?? 'Profil ismi güncellendi!',
			'settings.nameError' => TranslationOverrides.string(_root.$meta, 'settings.nameError', {}) ?? 'İsim boş olamaz!',
			'onboarding.skip' => TranslationOverrides.string(_root.$meta, 'onboarding.skip', {}) ?? 'Geç',
			'onboarding.next' => TranslationOverrides.string(_root.$meta, 'onboarding.next', {}) ?? 'İleri',
			'onboarding.getStarted' => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Başla',
			'onboarding.page1Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page1Title', {}) ?? 'Anlık Hava Durumu',
			'onboarding.page1Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page1Desc', {}) ?? 'Dünya genelindeki herhangi bir şehir için doğru hava durumu güncellemelerini alın.',
			'onboarding.page2Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page2Title', {}) ?? 'Haftalık Tahmin',
			'onboarding.page2Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page2Desc', {}) ?? '7 günlük hava durumu tahminleriyle haftanızı önceden planlayın.',
			'onboarding.page3Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page3Title', {}) ?? 'Şehirlerinizi Kaydedin',
			'onboarding.page3Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page3Desc', {}) ?? 'Aynı anda birden fazla şehrin hava durumunu takip edin.',
			'auth.welcomeBack' => TranslationOverrides.string(_root.$meta, 'auth.welcomeBack', {}) ?? 'Tekrar Hoş Geldiniz 👋',
			'auth.signInToContinue' => TranslationOverrides.string(_root.$meta, 'auth.signInToContinue', {}) ?? 'Devam etmek için giriş yapın',
			'auth.email' => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'E-posta',
			'auth.password' => TranslationOverrides.string(_root.$meta, 'auth.password', {}) ?? 'Şifre',
			'auth.forgotPassword' => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Şifremi Unuttum?',
			'auth.signIn' => TranslationOverrides.string(_root.$meta, 'auth.signIn', {}) ?? 'Giriş Yap',
			'auth.dontHaveAccount' => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Hesabınız yok mu?',
			'auth.signUp' => TranslationOverrides.string(_root.$meta, 'auth.signUp', {}) ?? 'Kayıt Ol',
			'auth.createAccount' => TranslationOverrides.string(_root.$meta, 'auth.createAccount', {}) ?? 'Hesap Oluştur 🌤️',
			'auth.signUpToGetStarted' => TranslationOverrides.string(_root.$meta, 'auth.signUpToGetStarted', {}) ?? 'Başlamak için kayıt olun',
			'auth.fullName' => TranslationOverrides.string(_root.$meta, 'auth.fullName', {}) ?? 'Ad Soyad',
			'auth.alreadyHaveAccount' => TranslationOverrides.string(_root.$meta, 'auth.alreadyHaveAccount', {}) ?? 'Zaten hesabınız var mı?',
			'auth.errorEmptyFields' => TranslationOverrides.string(_root.$meta, 'auth.errorEmptyFields', {}) ?? 'Lütfen tüm alanları doldurun',
			'auth.errorInvalidEmail' => TranslationOverrides.string(_root.$meta, 'auth.errorInvalidEmail', {}) ?? 'Lütfen geçerli bir e-posta adresi girin',
			'auth.errorPasswordTooShort' => TranslationOverrides.string(_root.$meta, 'auth.errorPasswordTooShort', {}) ?? 'Şifre en az 6 karakter olmalıdır',
			'news.title' => TranslationOverrides.string(_root.$meta, 'news.title', {}) ?? 'Haberler',
			'news.noNews' => TranslationOverrides.string(_root.$meta, 'news.noNews', {}) ?? 'Haber bulunamadı',
			_ => null,
		};
	}
}
