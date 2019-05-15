import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'queue_item.dart';
import 'package:qd_up_flutter/song_data.dart';

class Queue extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return QueueState();
  }

}

class QueueState extends State<Queue> {
  List<SongData> _songs;

  QueueState() {
    _songs = List();
    for (int i = 0; i < 10; ++i) {
      String label = "List item $i";
      _songs.add(SongData(title: label, artist: "artist", key: ValueKey(i)));
    }
  }

  int _indexOfKey(Key key) {
    return _songs.indexWhere((SongData d) => d.key == key);
  }

  void _remove(Key key) {
    _songs.removeAt(_songs.indexWhere((SongData d) => d.key == key));
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    final draggedItem = _songs[draggingIndex];
    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _songs.removeAt(draggingIndex);
      _songs.insert(newPositionIndex, draggedItem);
    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _songs[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableList(
        onReorder: this._reorderCallback,
        onReorderDone: this._reorderDone,
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Dismissible(
                        key: _songs[index].key,
                        onDismissed: (direction) {
                          _remove(_songs[index].key);
                        },
                        child: QueueItem(
                          data: _songs[index],
                          // first and last attributes affect border drawn during dragging
                          isFirst: index == 0,
                          isLast: index == _songs.length - 1,
                        ),
                      );
                    },
                    childCount: _songs.length,
                  ),
                )),
          ],
        ),
      )
    );
  }

  void _addListItem() {
    setState(() {
      int num = _songs.length;
      _songs.add(SongData(title:"item $num", artist: "artist", key: ValueKey(num)));
    });
  }
}