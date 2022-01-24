import 'package:flutter/foundation.dart';

class Url with ChangeNotifier {
  final String id;
  final String url;

  // Url({required this.id, required this.url});
  Url({required this.id, required this.url});

  void urlStatus() {
    notifyListeners();
  }
}
