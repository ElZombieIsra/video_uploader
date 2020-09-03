import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_uploader/utils/dates.dart';

class VideoContainer extends StatefulWidget {
  final StorageReference ref;

  const VideoContainer(
    this.ref, {
    Key key,
  }) : super(key: key);

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  StorageMetadata metadata;
  DateTime createdDateTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(18),
      leading: Icon(
        Icons.video_library,
        size: 40,
      ),
      title: Text(metadata?.name ?? ''),
      trailing: Text(DatesUtils.formatDate(createdDateTime)),
    );
  }

  void init() async {
    final StorageMetadata _metadata = await widget.ref.getMetadata();
    setState(() {
      metadata = _metadata;
      createdDateTime = DateTime.fromMillisecondsSinceEpoch(
        _metadata.creationTimeMillis,
      );
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }
}
