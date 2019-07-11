

import 'package:favmovie/model/entity.dart';
import 'package:flutter/cupertino.dart';

class MovieBox extends StatelessWidget {

  final MovieData movieData;

  const MovieBox({@required this.movieData}) : assert(movieData != null);


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Text(movieData.title)),
          ],
        ),
      ),
    );
  }

}
