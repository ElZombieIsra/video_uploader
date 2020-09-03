import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_uploader/presentation/components/video_uploading.dart';
import 'package:video_uploader/presentation/data/firebase_repository.dart';
import 'package:video_uploader/utils/files.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const IconData _uploadIcon = Icons.file_upload;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  List<StorageUploadTask> _uploadTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Vídeos"),
        actions: [
          IconButton(
            icon: Icon(_uploadIcon),
            onPressed: _uploadVideo,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _uploadTasks.length == 0 ? 1 : _uploadTasks.length,
          itemBuilder: (context, i) {
            if (_uploadTasks.length == 0) {
              return _UploadVideoAlert(_uploadIcon);
            }
            return VideoUploading(_uploadTasks[i]);
          },
        ),
      ),
    );
  }

  void _uploadVideo() async {
    try {
      File video = await FilesUtil.getVideoFromGallery();
      StorageUploadTask _task = _firebaseRepository.uploadVideo(
        DateTime.now().toIso8601String(),
        video,
      );
      setState(() => _uploadTasks.add(_task));
    } catch (e) {
      showAlert("Ocurrió un error al cargar el video. Error: ${e.toString()}");
    }
  }

  void showAlert(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _UploadVideoAlert extends StatelessWidget {
  final IconData icon;
  static const Color _textColor = Colors.black54;

  const _UploadVideoAlert(
    this.icon, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Agrega videos de tu carrete presionando el ícono ",
              ),
              WidgetSpan(
                child: Icon(
                  icon,
                  color: _textColor,
                ),
              ),
            ],
            style: TextStyle(color: _textColor),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
