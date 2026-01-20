import 'package:file_picker/file_picker.dart';

class FilePickerUtils {
  static Future<String?> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result == null) return null;
      if (result.files.isEmpty || result.files.first.path == null) {
        return null;
      }
      return result.files.first.path;
    } catch (_) {
      return null;
    }
  }
}
