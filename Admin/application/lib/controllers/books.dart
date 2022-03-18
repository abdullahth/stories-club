import 'dart:convert';

import 'package:application/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BooksProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Book>? _books;
  final Client _client = Client();
  final _apiUrl = const String.fromEnvironment("API_GLOBAL_LINK",
      defaultValue: "http://127.168.1.1:3000");

  List<Book> get books => _books!;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(IterableProperty("BOOKS", books));
    super.debugFillProperties(properties);
  }

  Future<bool> fetchBooks({
    bool filterByEarlyRegistration = false,
    bool filterByMostLiking = false,
    bool filterByMostOrders = false,
  }) async {
    try {
      final response = await _client.get(Uri.parse("$_apiUrl/books/"));
      if (response.statusCode != 200) {
        return Future.value(false);
      }

      final data = jsonDecode(response.body);
      _books = [];
      for (var bookMap in data["books"]) {
        _books!.add(Book.fromMap(bookMap));
      }

      if (_books != null || _books!.isNotEmpty) {
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

  Future<bool> deleteBook(id) async {
    try {
      final response = await _client.delete(Uri.parse("$_apiUrl/books/id=$id"));
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
