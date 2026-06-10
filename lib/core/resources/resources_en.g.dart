///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang/overrides.dart';
import 'resources.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get projectName => TranslationOverrides.string(_root.$meta, 'projectName', {}) ?? 'Weathernaut';
	@override String get appName => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Weathernaut';
	@override String get welcome => TranslationOverrides.string(_root.$meta, 'welcome', {}) ?? 'Welcome to Weathernaut';
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
	@override late final _TranslationsSearchEn search = _TranslationsSearchEn._(_root);
	@override late final _TranslationsSettingsEn settings = _TranslationsSettingsEn._(_root);
}

// Path: home
class _TranslationsHomeEn implements TranslationsHomeTr {
	_TranslationsHomeEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => TranslationOverrides.string(_root.$meta, 'home.title', {}) ?? 'Weather Dashboard';
	@override String get humidity => TranslationOverrides.string(_root.$meta, 'home.humidity', {}) ?? 'Humidity';
	@override String get wind => TranslationOverrides.string(_root.$meta, 'home.wind', {}) ?? 'Wind Speed';
	@override String get pressure => TranslationOverrides.string(_root.$meta, 'home.pressure', {}) ?? 'Pressure';
	@override String get feelsLike => TranslationOverrides.string(_root.$meta, 'home.feelsLike', {}) ?? 'Feels Like';
	@override String get hourlyForecast => TranslationOverrides.string(_root.$meta, 'home.hourlyForecast', {}) ?? 'Hourly Forecast';
	@override String get dailyForecast => TranslationOverrides.string(_root.$meta, 'home.dailyForecast', {}) ?? '7-Day Forecast';
	@override String get searchPrompt => TranslationOverrides.string(_root.$meta, 'home.searchPrompt', {}) ?? 'Search for a city...';
}

// Path: search
class _TranslationsSearchEn implements TranslationsSearchTr {
	_TranslationsSearchEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => TranslationOverrides.string(_root.$meta, 'search.title', {}) ?? 'Search';
	@override String get placeholder => TranslationOverrides.string(_root.$meta, 'search.placeholder', {}) ?? 'Enter city name...';
	@override String get noResults => TranslationOverrides.string(_root.$meta, 'search.noResults', {}) ?? 'No cities found';
	@override String get recentSearches => TranslationOverrides.string(_root.$meta, 'search.recentSearches', {}) ?? 'Recent Searches';
}

// Path: settings
class _TranslationsSettingsEn implements TranslationsSettingsTr {
	_TranslationsSettingsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings';
	@override String get theme => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Theme Mode';
	@override String get systemTheme => TranslationOverrides.string(_root.$meta, 'settings.systemTheme', {}) ?? 'System Default';
	@override String get darkMode => TranslationOverrides.string(_root.$meta, 'settings.darkMode', {}) ?? 'Dark Mode';
	@override String get lightMode => TranslationOverrides.string(_root.$meta, 'settings.lightMode', {}) ?? 'Light Mode';
	@override String get units => TranslationOverrides.string(_root.$meta, 'settings.units', {}) ?? 'Temperature Units';
	@override String get celsius => TranslationOverrides.string(_root.$meta, 'settings.celsius', {}) ?? 'Celsius (°C)';
	@override String get fahrenheit => TranslationOverrides.string(_root.$meta, 'settings.fahrenheit', {}) ?? 'Fahrenheit (°F)';
	@override String get language => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Language';
	@override String get english => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English';
	@override String get turkish => TranslationOverrides.string(_root.$meta, 'settings.turkish', {}) ?? 'Türkçe';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'projectName' => TranslationOverrides.string(_root.$meta, 'projectName', {}) ?? 'Weathernaut',
			'appName' => TranslationOverrides.string(_root.$meta, 'appName', {}) ?? 'Weathernaut',
			'welcome' => TranslationOverrides.string(_root.$meta, 'welcome', {}) ?? 'Welcome to Weathernaut',
			'home.title' => TranslationOverrides.string(_root.$meta, 'home.title', {}) ?? 'Weather Dashboard',
			'home.humidity' => TranslationOverrides.string(_root.$meta, 'home.humidity', {}) ?? 'Humidity',
			'home.wind' => TranslationOverrides.string(_root.$meta, 'home.wind', {}) ?? 'Wind Speed',
			'home.pressure' => TranslationOverrides.string(_root.$meta, 'home.pressure', {}) ?? 'Pressure',
			'home.feelsLike' => TranslationOverrides.string(_root.$meta, 'home.feelsLike', {}) ?? 'Feels Like',
			'home.hourlyForecast' => TranslationOverrides.string(_root.$meta, 'home.hourlyForecast', {}) ?? 'Hourly Forecast',
			'home.dailyForecast' => TranslationOverrides.string(_root.$meta, 'home.dailyForecast', {}) ?? '7-Day Forecast',
			'home.searchPrompt' => TranslationOverrides.string(_root.$meta, 'home.searchPrompt', {}) ?? 'Search for a city...',
			'search.title' => TranslationOverrides.string(_root.$meta, 'search.title', {}) ?? 'Search',
			'search.placeholder' => TranslationOverrides.string(_root.$meta, 'search.placeholder', {}) ?? 'Enter city name...',
			'search.noResults' => TranslationOverrides.string(_root.$meta, 'search.noResults', {}) ?? 'No cities found',
			'search.recentSearches' => TranslationOverrides.string(_root.$meta, 'search.recentSearches', {}) ?? 'Recent Searches',
			'settings.title' => TranslationOverrides.string(_root.$meta, 'settings.title', {}) ?? 'Settings',
			'settings.theme' => TranslationOverrides.string(_root.$meta, 'settings.theme', {}) ?? 'Theme Mode',
			'settings.systemTheme' => TranslationOverrides.string(_root.$meta, 'settings.systemTheme', {}) ?? 'System Default',
			'settings.darkMode' => TranslationOverrides.string(_root.$meta, 'settings.darkMode', {}) ?? 'Dark Mode',
			'settings.lightMode' => TranslationOverrides.string(_root.$meta, 'settings.lightMode', {}) ?? 'Light Mode',
			'settings.units' => TranslationOverrides.string(_root.$meta, 'settings.units', {}) ?? 'Temperature Units',
			'settings.celsius' => TranslationOverrides.string(_root.$meta, 'settings.celsius', {}) ?? 'Celsius (°C)',
			'settings.fahrenheit' => TranslationOverrides.string(_root.$meta, 'settings.fahrenheit', {}) ?? 'Fahrenheit (°F)',
			'settings.language' => TranslationOverrides.string(_root.$meta, 'settings.language', {}) ?? 'Language',
			'settings.english' => TranslationOverrides.string(_root.$meta, 'settings.english', {}) ?? 'English',
			'settings.turkish' => TranslationOverrides.string(_root.$meta, 'settings.turkish', {}) ?? 'Türkçe',
			_ => null,
		};
	}
}
