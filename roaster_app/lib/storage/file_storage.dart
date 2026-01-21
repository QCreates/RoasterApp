import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'local_storage.dart';

class FileStorage implements LocalStorage {
  final String filename;

  FileStorage(this.filename);

  Future<File> _file() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  @override
  Future<List<Map<String, dynamic>>> load() async {
    final file = await _file();
    if (!await file.exists()) {
      await file.writeAsString('[]');
    }
    final content = await file.readAsString();
    final List data = jsonDecode(content);
    return data.cast<Map<String, dynamic>>();
  }

  @override
  Future<void> save(List<Map<String, dynamic>> data) async {
    final file = await _file();
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(data),
    );
  }
}
