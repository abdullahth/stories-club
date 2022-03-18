import 'dart:convert';

import 'package:application/models/videos.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class VideosProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Video>? _videos;
  final Client _client = Client();
  final _apiUrl = const String.fromEnvironment("API_GLOBAL_LINK",
      defaultValue: "http://127.168.1.1:3000");

  List<Video> get videos => _videos!;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty("VIDEOS", videos));
    super.debugFillProperties(properties);
  }

  Future<bool> fetchVideos() async {
    try {
      final response = await _client.get(Uri.parse("$_apiUrl/videos/"));
      if (response.statusCode != 200) {
        return Future.value(false);
      }

      final data = jsonDecode(response.body);
      _videos = [];
      for (var bookMap in data["videos"]) {
        _videos!.add(Video.fromMap(bookMap));
      }

      if (_videos != null || _videos!.isNotEmpty) {
        return Future.value(true);
      }
      return Future.value(false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value(false);
    }
  }

  Future<bool> deleteVideo(id) async {
    try {
      final response = await _client.delete(Uri.parse("$_apiUrl/videos/id=$id"));
      if (response.statusCode != 200) {
        if (kDebugMode) {
          print(response.statusCode);
        }
        return Future.value(false);
      }
      return Future.value(true);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.value(false);
    }
  }
}
