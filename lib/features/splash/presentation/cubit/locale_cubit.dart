import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/usecases/change_locale.dart';
import '../../domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final GetChangeLocaleUseCase getChangeLocaleUseCase;
  LocaleCubit(
      {required this.getChangeLocaleUseCase, required this.getSavedLangUseCase})
      : super(const ChangeLocaleState(Locale(AppStrings.englishCode)));

  //!get saved Lang
  String currentLangCode = AppStrings.englishCode;
  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase.call(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = value;
      emit(
        ChangeLocaleState(Locale(currentLangCode)),
      );
    });
  }

  //! change locale
  Future<void> _changeLang(String langCode) async {
    final response = await getChangeLocaleUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(
        ChangeLocaleState(Locale(currentLangCode)),
      );
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toArabic() => _changeLang(AppStrings.arabicCode);
}
