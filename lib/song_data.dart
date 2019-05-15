import 'package:flutter/widgets.dart';

class SongData {
  SongData({@required this.title, @required this.artist, this.key});

  final String title;
  final String artist;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}