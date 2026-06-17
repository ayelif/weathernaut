part of 'locale_bloc.dart';

class LocaleState extends Equatable {
  final AppLocale locale;

  const LocaleState(this.locale);

  @override
  List<Object?> get props => [locale];
}
