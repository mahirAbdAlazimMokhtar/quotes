import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/quote.dart';
import '../repositories/quote_repository.dart';

class GetRandomQuoteUseCase implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetRandomQuoteUseCase({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) async {
    return quoteRepository.getRandomQuote();
  }
}
