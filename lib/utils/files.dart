import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FilesUtil {
  /// Returns a File from the selected video from the user
  ///
  /// Returns null if there's no file selected
  static Future<File> getVideoFromGallery() async {
    PickedFile _file = await ImagePicker().getVideo(
      source: ImageSource.gallery,
    );
    if (_file != null) {
      return File(_file.path);
    }
    return null;
  }
}
