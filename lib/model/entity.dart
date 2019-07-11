import 'package:flutter/cupertino.dart';

// Entity for movie object
class MovieData {
  final String title;
  final String imageUrl;

  const MovieData({@required this.title, @required this.imageUrl})
      : assert(title != null),
        assert(imageUrl != null);


  /// Creates a [Unit] from a JSON object.
  MovieData.fromJson(Map jsonMap)
      : assert(jsonMap['title'] != null),
        assert(jsonMap['poster_path'] != null),
        title = jsonMap['title'],
        imageUrl = jsonMap['poster_path'];
}
