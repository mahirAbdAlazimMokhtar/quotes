import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';

abstract class LangLocalDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String> getSaveLang();
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;

  LangLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, langCode);
  @override
  Future<String> getSaveLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)!
          : AppStrings.englishCode;
}
