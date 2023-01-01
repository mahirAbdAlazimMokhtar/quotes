import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/network/exceptions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> gtLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quoteModel);
}

class RandomQuoteLocalDataSourceImpl implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quoteModel) {
    return sharedPreferences.setString(
        AppStrings.cacheRandomQuote, json.encode(quoteModel));
  }

  @override
  Future<QuoteModel> gtLastRandomQuote() async {
    final jsonString = sharedPreferences.getString(AppStrings.cacheRandomQuote);
    if (jsonString != null) {
      final cachedRandomQuote =
          Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
