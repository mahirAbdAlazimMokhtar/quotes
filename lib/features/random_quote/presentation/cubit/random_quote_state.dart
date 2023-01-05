part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoadingQuote extends RandomQuoteState {}

class RandomQuoteLoadedQuote extends RandomQuoteState {
  final Quote quoteModel;

  const RandomQuoteLoadedQuote({required this.quoteModel});
  @override
  List<Object> get props => [quoteModel];
}

class RandomQuoteErrorQuote extends RandomQuoteState {
  final String message;

  const RandomQuoteErrorQuote({required this.message});
  @override
  List<Object> get props => [message];
}
