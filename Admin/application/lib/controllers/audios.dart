import 'dart:convert';

import 'package:application/models/audios.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AudioProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Audio>? _audios;
  final Client _client = Client();
  final _apiUrl = const String.fromEnvironment("API_GLOBAL_LINK",
      defaultValue: "http://127.168.1.1:3000");

  List<Audio> get audios => _audios!;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty("AUDIOS", audios));
    super.debugFillProperties(properties);
  }

  Future<bool> fetchAudios() async {
    try {
      final response = await _client.get(Uri.parse("$_apiUrl/audios/"));
      if (response.statusCode != 200) {
        return Future.value(false);
      }

      final data = jsonDecode(response.body);
      _audios = [];
      for (var bookMap in data["audios"]) {
        _audios!.add(Audio.fromMap(bookMap));
      }

      if (_audios != null || _audios!.isNotEmpty) {
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

  Future<bool> deleteAudio(id) async {
    try {
      final response = await _client.delete(Uri.parse("$_apiUrl/audios/id=$id"));
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
