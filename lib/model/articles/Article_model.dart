
import 'dart:convert';

class Articles{
 final String title;
 final String author;
 final String description;
 final String url;
 final String urlToImage;
 final String publishedAt;
 final String content;

 const Articles({ required this.title,
    required this.author,required this.description,
    required this.url, required this.urlToImage,
    required this.publishedAt,
    required this.content});


  factory Articles.fromJson()
 {
   return Articles(
      title: jsonDecode("title"),
      author: jsonDecode("author"),
      description: jsonDecode("description"),
      url: jsonDecode("url"),
      urlToImage: jsonDecode("urlToImage"),
      publishedAt: jsonDecode("publishedAt"),
      content: jsonDecode("content"),
    );
  }

}
