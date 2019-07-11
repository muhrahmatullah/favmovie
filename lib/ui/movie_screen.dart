import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final String title;

  const MovieScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
