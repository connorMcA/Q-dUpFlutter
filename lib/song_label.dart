import 'package:flutter/material.dart';

import 'song_data.dart';

class SongLabel extends StatelessWidget {

  SongData data;

  SongLabel({@required this.data});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
      child:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(data.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead),
            ),
            Container(
              child: Text(data.artist,
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption),
            ),
          ],
        ),
      )
    );
  }

}