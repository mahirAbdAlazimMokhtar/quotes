import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required String author,
      required String id,
      required String content,
      })
      : super(author: author, id: id, content: content,);

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["_id"],
        content: json["content"],
        
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "_id": id,
        "content": content,
       
      };
}
