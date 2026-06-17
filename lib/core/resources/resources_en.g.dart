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
	@override late final _TranslationsOnboardingEn onboarding = _TranslationsOnboardingEn._(_root);
	@override late final _TranslationsAuthEn auth = _TranslationsAuthEn._(_root);
	@override late final _TranslationsNewsEn news = _TranslationsNewsEn._(_root);
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
	@override String get logout => TranslationOverrides.string(_root.$meta, 'settings.logout', {}) ?? 'Log Out';
}

// Path: onboarding
class _TranslationsOnboardingEn implements TranslationsOnboardingTr {
	_TranslationsOnboardingEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get skip => TranslationOverrides.string(_root.$meta, 'onboarding.skip', {}) ?? 'Skip';
	@override String get next => TranslationOverrides.string(_root.$meta, 'onboarding.next', {}) ?? 'Next';
	@override String get getStarted => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Get Started';
	@override String get page1Title => TranslationOverrides.string(_root.$meta, 'onboarding.page1Title', {}) ?? 'Real-Time Weather';
	@override String get page1Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page1Desc', {}) ?? 'Get accurate weather updates for any city around the world.';
	@override String get page2Title => TranslationOverrides.string(_root.$meta, 'onboarding.page2Title', {}) ?? 'Weekly Forecast';
	@override String get page2Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page2Desc', {}) ?? 'Plan your week ahead with 7-day weather forecasts.';
	@override String get page3Title => TranslationOverrides.string(_root.$meta, 'onboarding.page3Title', {}) ?? 'Save Your Cities';
	@override String get page3Desc => TranslationOverrides.string(_root.$meta, 'onboarding.page3Desc', {}) ?? 'Track weather for multiple cities at once.';
}

// Path: auth
class _TranslationsAuthEn implements TranslationsAuthTr {
	_TranslationsAuthEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get welcomeBack => TranslationOverrides.string(_root.$meta, 'auth.welcomeBack', {}) ?? 'Welcome Back 👋';
	@override String get signInToContinue => TranslationOverrides.string(_root.$meta, 'auth.signInToContinue', {}) ?? 'Sign in to continue';
	@override String get email => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'Email';
	@override String get password => TranslationOverrides.string(_root.$meta, 'auth.password', {}) ?? 'Password';
	@override String get forgotPassword => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Forgot Password?';
	@override String get signIn => TranslationOverrides.string(_root.$meta, 'auth.signIn', {}) ?? 'Sign In';
	@override String get dontHaveAccount => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Don\'t have an account?';
	@override String get signUp => TranslationOverrides.string(_root.$meta, 'auth.signUp', {}) ?? 'Sign Up';
	@override String get createAccount => TranslationOverrides.string(_root.$meta, 'auth.createAccount', {}) ?? 'Create Account 🌤️';
	@override String get signUpToGetStarted => TranslationOverrides.string(_root.$meta, 'auth.signUpToGetStarted', {}) ?? 'Sign up to get started';
	@override String get fullName => TranslationOverrides.string(_root.$meta, 'auth.fullName', {}) ?? 'Full Name';
	@override String get alreadyHaveAccount => TranslationOverrides.string(_root.$meta, 'auth.alreadyHaveAccount', {}) ?? 'Already have an account?';
	@override String get errorEmptyFields => TranslationOverrides.string(_root.$meta, 'auth.errorEmptyFields', {}) ?? 'Please fill in all fields';
	@override String get errorInvalidEmail => TranslationOverrides.string(_root.$meta, 'auth.errorInvalidEmail', {}) ?? 'Please enter a valid email address';
	@override String get errorPasswordTooShort => TranslationOverrides.string(_root.$meta, 'auth.errorPasswordTooShort', {}) ?? 'Password must be at least 6 characters';
}

// Path: news
class _TranslationsNewsEn implements TranslationsNewsTr {
	_TranslationsNewsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => TranslationOverrides.string(_root.$meta, 'news.title', {}) ?? 'News';
	@override String get noNews => TranslationOverrides.string(_root.$meta, 'news.noNews', {}) ?? 'No news found';
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
			'settings.logout' => TranslationOverrides.string(_root.$meta, 'settings.logout', {}) ?? 'Log Out',
			'onboarding.skip' => TranslationOverrides.string(_root.$meta, 'onboarding.skip', {}) ?? 'Skip',
			'onboarding.next' => TranslationOverrides.string(_root.$meta, 'onboarding.next', {}) ?? 'Next',
			'onboarding.getStarted' => TranslationOverrides.string(_root.$meta, 'onboarding.getStarted', {}) ?? 'Get Started',
			'onboarding.page1Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page1Title', {}) ?? 'Real-Time Weather',
			'onboarding.page1Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page1Desc', {}) ?? 'Get accurate weather updates for any city around the world.',
			'onboarding.page2Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page2Title', {}) ?? 'Weekly Forecast',
			'onboarding.page2Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page2Desc', {}) ?? 'Plan your week ahead with 7-day weather forecasts.',
			'onboarding.page3Title' => TranslationOverrides.string(_root.$meta, 'onboarding.page3Title', {}) ?? 'Save Your Cities',
			'onboarding.page3Desc' => TranslationOverrides.string(_root.$meta, 'onboarding.page3Desc', {}) ?? 'Track weather for multiple cities at once.',
			'auth.welcomeBack' => TranslationOverrides.string(_root.$meta, 'auth.welcomeBack', {}) ?? 'Welcome Back 👋',
			'auth.signInToContinue' => TranslationOverrides.string(_root.$meta, 'auth.signInToContinue', {}) ?? 'Sign in to continue',
			'auth.email' => TranslationOverrides.string(_root.$meta, 'auth.email', {}) ?? 'Email',
			'auth.password' => TranslationOverrides.string(_root.$meta, 'auth.password', {}) ?? 'Password',
			'auth.forgotPassword' => TranslationOverrides.string(_root.$meta, 'auth.forgotPassword', {}) ?? 'Forgot Password?',
			'auth.signIn' => TranslationOverrides.string(_root.$meta, 'auth.signIn', {}) ?? 'Sign In',
			'auth.dontHaveAccount' => TranslationOverrides.string(_root.$meta, 'auth.dontHaveAccount', {}) ?? 'Don\'t have an account?',
			'auth.signUp' => TranslationOverrides.string(_root.$meta, 'auth.signUp', {}) ?? 'Sign Up',
			'auth.createAccount' => TranslationOverrides.string(_root.$meta, 'auth.createAccount', {}) ?? 'Create Account 🌤️',
			'auth.signUpToGetStarted' => TranslationOverrides.string(_root.$meta, 'auth.signUpToGetStarted', {}) ?? 'Sign up to get started',
			'auth.fullName' => TranslationOverrides.string(_root.$meta, 'auth.fullName', {}) ?? 'Full Name',
			'auth.alreadyHaveAccount' => TranslationOverrides.string(_root.$meta, 'auth.alreadyHaveAccount', {}) ?? 'Already have an account?',
			'auth.errorEmptyFields' => TranslationOverrides.string(_root.$meta, 'auth.errorEmptyFields', {}) ?? 'Please fill in all fields',
			'auth.errorInvalidEmail' => TranslationOverrides.string(_root.$meta, 'auth.errorInvalidEmail', {}) ?? 'Please enter a valid email address',
			'auth.errorPasswordTooShort' => TranslationOverrides.string(_root.$meta, 'auth.errorPasswordTooShort', {}) ?? 'Password must be at least 6 characters',
			'news.title' => TranslationOverrides.string(_root.$meta, 'news.title', {}) ?? 'News',
			'news.noNews' => TranslationOverrides.string(_root.$meta, 'news.noNews', {}) ?? 'No news found',
			_ => null,
		};
	}
}
