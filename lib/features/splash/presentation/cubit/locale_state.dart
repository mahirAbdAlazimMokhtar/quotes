part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class ChangeLocaleState extends LocaleState {
  const ChangeLocaleState(Locale selectedLocale)
      : super(locale: selectedLocale);
}
