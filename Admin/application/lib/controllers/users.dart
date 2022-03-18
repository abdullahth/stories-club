import 'dart:convert';

import 'package:application/models/users.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class UsersProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<User>? _users;
  final Client _client = Client();
  final _apiUrl = const String.fromEnvironment("API_GLOBAL_LINK",
      defaultValue: "http://127.168.1.1:3000");

  List<User> get users => _users!;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty("USERS", users));
    super.debugFillProperties(properties);
  }

  Future<bool> fetchUsers() async {
    try {
      final response = await _client.get(Uri.parse("$_apiUrl/users/"));
      if (response.statusCode != 200) {
        return Future.value(false);
      }

      final data = jsonDecode(response.body);
      _users = [];
      for (var userMap in data["users"]) {
        _users!.add(User.formMap(userMap));
      }

      if (_users != null || _users!.isNotEmpty) {
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

  Future<bool> deleteUser(String id) async {
    try {
      final response = await _client.delete(Uri.parse("$_apiUrl/users/$id"));
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

  Future<bool> verifyUser(String id) async {
    try {
      final response =
          await _client.patch(Uri.parse("$_apiUrl/users/verify/$id"));
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

  Future<bool> unverifyUser(String id) async {
    try {
      final response =
          await _client.patch(Uri.parse("$_apiUrl/users/unverify/$id"));
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
