part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteLoadingQuote extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteLoaded({required this.quote});
  @override
  List<Object> get props => [quote];
}

class RandomQuoteError extends RandomQuoteState {
  final String message;

  const RandomQuoteError({required this.message});
  @override
  List<Object> get props => [message];
}
