import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AppStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<String> readFile(String filename) async {
    try {
      final file = await _localFile('$filename');

      // Read the file
      final contents = await file.readAsString();

	  return contents;
    } catch (e) {
      // If encountering an error, return an empty string
      return '';
    }
  }

  Future<File> writeFile(String filename, String content) async {
    final file = await _localFile('$filename');

    // Write the file
    return file.writeAsString('$content');
  }
}
