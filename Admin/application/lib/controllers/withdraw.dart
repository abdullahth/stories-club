import 'package:application/controllers/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/src/provider.dart';

class Withdraw with ChangeNotifier, DiagnosticableTreeMixin {
  List<Map>? _requests;
  final Client _client = Client();
  final _apiUrl = const String.fromEnvironment("API_GLOBAL_LINK",
      defaultValue: "http://127.168.1.1:3000");

  List<Map> get requests => _requests!;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty("WITHDRAWS", requests));
    super.debugFillProperties(properties);
  }

  Future<bool> fetchRequests(BuildContext context) async {
    try {
      final _usersProv = context.watch<UsersProvider>();
      final _users = _usersProv.users
          .where((element) => element.withdrawlRequests.isNotEmpty)
          .toList();

      print(_users.first.json);
      _requests = [];
      for (var user in _users) {
        final logs = [];
        final maxTime = user.withdrawlRequests.last["time"];
        print(user.log);
        for (var key in user.log.keys) {
          print(key);
          // if (entry.key >= maxTime) {
          //   logs.add(entry.value);
          // }
        }
      }

      print(_requests);

      return Future.value(true);
    } catch (e) {
      return Future.value(false);
    }
  }
}
