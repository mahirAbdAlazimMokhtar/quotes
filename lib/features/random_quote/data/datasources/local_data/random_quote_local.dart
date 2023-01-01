import 'package:dartz/dartz.dart';

import '../../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> gtLastRandomQuote();
  Future<Unit> cacheQuote(QuoteModel quoteModel);
}
