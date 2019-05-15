import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:qd_up_flutter/song_data.dart';
import '../style_manager.dart';
import '../song_label.dart';

class QueueItem extends StatelessWidget {

  QueueItem({
    this.data,
    this.isFirst,
    this.isLast,
  });

  final SongData data;
  final bool isFirst;
  final bool isLast;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration =
          BoxDecoration(color: StyleManager.primarySlightlyTransparent);
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : StyleManager.background);
    }

    Widget content = Container(
      decoration: decoration,
      child: SafeArea(
          top: false,
          bottom: false,
          child: Opacity(
            // hide content for placeholder
            opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                        child: SongLabel(data: data),
                      ),
                  // Triggers the reordering
                  DragHandle(),
                ],
              ),
            ),
          )),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: data.key, //
        childBuilder: _buildChild);
  }
}

class DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ReorderableListener(
        child: Container(
          padding: EdgeInsets.only(right: 18.0, left: 18.0),
          color: StyleManager.backgroundClicked,
          child: Center(
            child: Icon(Icons.reorder, color: StyleManager.colorAccent),
          ),
        ),
      );
  }
}
