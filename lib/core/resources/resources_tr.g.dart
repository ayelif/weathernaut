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
			_ => null,
		};
	}
}
