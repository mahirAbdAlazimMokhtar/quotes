import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required super.author,
      required super.content,
      required super.permalink,
      required super.id});
  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
      id: json["_id"],
      content: json["quote"],
      author: json["author"],
      permalink: json['permalink']);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "quote": content,
        "author": author,
        'permalink':permalink
      };
}
