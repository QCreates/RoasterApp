abstract class LocalStorage {
  Future<List<Map<String, dynamic>>> load();
  Future<void> save(List<Map<String, dynamic>> data);
}
