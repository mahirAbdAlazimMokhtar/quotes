import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/api/end_points.dart';
import '../../../../../core/network/exceptions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  final http.Client client;
  RandomQuoteRemoteDataSourceImpl({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await client.get(Uri.parse(Endpoints.randomQuote),
        headers: {AppStrings.contentType: AppStrings.applicationJson});
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw ServerException();
    }
  }
}
