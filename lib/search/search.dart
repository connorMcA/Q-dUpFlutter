import 'package:flutter/material.dart';
import '../song_label.dart';
import '../song_data.dart';

class Search extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: <Widget>[
        SongLabel(data: SongData(title: "List", artist: "artist")),
        SongLabel(data: SongData(title: "b", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
        SongLabel(data: SongData(title: "c", artist: "artist")),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

}