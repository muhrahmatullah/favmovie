import 'package:favmovie/model/entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

const String base_poster = "http://image.tmdb.org/t/p/w185";

class MovieBox extends StatelessWidget {
  final MovieData movieData;

  const MovieBox({@required this.movieData}) : assert(movieData != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 18.0),
                        child: Center(child: CircularProgressIndicator())),
                    Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: base_poster + movieData.imageUrl),
                    ),
                  ],
                ),
              ),
              Center(child: Text(movieData.title)),
            ],
          ),
        ),
      ),
    );
  }
}
