import 'dart:convert';
import 'dart:html' as html;

import 'local_storage.dart';

class WebStorage implements LocalStorage {
  final String key;

  WebStorage(this.key);

  @override
  Future<List<Map<String, dynamic>>> load() async {
    final raw = html.window.localStorage[key];
    if (raw == null) return [];
    final List data = jsonDecode(raw);
    return data.cast<Map<String, dynamic>>();
  }

  @override
  Future<void> save(List<Map<String, dynamic>> data) async {
    html.window.localStorage[key] =
        const JsonEncoder.withIndent('  ').convert(data);
  }
}
