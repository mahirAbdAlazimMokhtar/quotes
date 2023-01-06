// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/error/failure.dart';
import 'package:quotes/core/usecase/usecase.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';

import '../../domain/entities/quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  Future<void> getRandomQuote() async {
    var response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
        (failure) => RandomQuoteError(message: mapFailureToMessage(failure)),
        (quote) => RandomQuoteLoaded(quote: quote)));
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
