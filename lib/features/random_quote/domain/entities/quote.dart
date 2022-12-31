import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String content;
  final String permalink;
  final int id;

  const Quote(
      {required this.author,
      required this.content,
      required this.permalink,
      required this.id});
      
        @override
        
        List<Object?> get props => 
        throw [author,content,permalink,id];

}
