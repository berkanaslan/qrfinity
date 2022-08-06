import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class Path {
  Future<String> getTemporaryPNGPath();

  Future<String> getStoragePNGPath();
}

class DevicePath implements Path {
  String? name;

  @override
  Future<String> getTemporaryPNGPath() async {
    Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final now = DateTime.now().millisecondsSinceEpoch.toString();
    return "$tempPath/$now.png";
  }

  @override
  Future<String> getStoragePNGPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    final now = DateTime.now().millisecondsSinceEpoch.toString();
    return "$path/$now.png";
  }
}
