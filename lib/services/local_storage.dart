import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  static const _fileName = 'notes.json';

  static Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  static Future<void> saveNotes(List<String> notes) async {
    final file = await _getFile();
    final json = jsonEncode(notes);
    await file.writeAsString(json);
  }

  static Future<List<String>> loadNotes() async {
    try {
      final file = await _getFile();
      if (await file.exists()) {
        final content = await file.readAsString();
        final List decoded = jsonDecode(content);
        return decoded.cast<String>();
      }
    } catch (_) {}
    return [];
  }

  static Future<void> clearNotes() async {
    final file = await _getFile();
    if (await file.exists()) {
      await file.delete();
    }
  }
}
