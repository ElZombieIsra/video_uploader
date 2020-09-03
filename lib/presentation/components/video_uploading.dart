import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_uploader/presentation/components/loader.dart';
import 'package:video_uploader/presentation/components/video_container.dart';

class VideoUploading extends StatelessWidget {
  final StorageUploadTask task;

  const VideoUploading(
    this.task, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<StorageTaskEvent>(
      stream: task.events,
      builder: (context, snap) {
        if (!snap.hasData) {
          return Container();
        }
        StorageTaskSnapshot snapshot = snap.data.snapshot;
        print(snap.data.type);
        if (snap.data.type == StorageTaskEventType.failure) {
          return Text("Ocurrió un error :c ${snap.data.snapshot.error}");
        }
        if (snap.data.type == StorageTaskEventType.progress) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Subiendo"),
                Container(width: 10),
                Expanded(
                  child: LinearLoader(
                    value: snapshot.bytesTransferred / snapshot.totalByteCount,
                  ),
                ),
              ],
            ),
          );
        }
        return VideoContainer(snapshot.ref);
      },
    );
  }
}
