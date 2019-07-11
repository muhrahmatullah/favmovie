import 'package:favmovie/model/entity.dart';
import 'package:favmovie/network/api.dart';
import 'package:favmovie/ui/movie_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final String title;

  const MovieScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _results = <MovieData>[];

  Future<void> _fetchMovieData() async {
    final api = Api();
    final jsonResult = await api.fetchMovieList('popular');
    print(jsonResult);
    if (jsonResult != null) {
      for (var result in jsonResult) {
        _results.add(MovieData.fromJson(result));
      }
    }
    setState(() {});
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    // We have static unit conversions located in our
    // assets/data/regular_units.json
    // and we want to also obtain up-to-date Currency conversions from the web
    // We only want to load our data in once
    if (_results.isEmpty) {
      await _fetchMovieData();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_results.isEmpty) {
      return Center(
        child: Container(
          height: 180.0,
          width: 180.0,
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(child:
          ListView.builder(itemBuilder: (BuildContext context, int index) {
        return MovieBox(movieData: _results[index],);
      }, itemCount: _results.length,)),
    );
  }
}
