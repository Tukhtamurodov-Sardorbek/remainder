extension StringExt on String {
  String get toSnakeCase {
    return replaceAllMapped(
          RegExp(r'([a-z0-9])([A-Z])'),
          (m) => '${m[1]}_${m[2]}',
        )
        // insert underscore between two uppers when the second is followed by lowercase
        .replaceAllMapped(
          RegExp(r'([A-Z])([A-Z][a-z])'),
          (m) => '${m[1]}_${m[2]}',
        )
        // insert underscore between letter and number
        .replaceAllMapped(
          RegExp(r'([a-zA-Z])([0-9])'),
          (m) => '${m[1]}_${m[2]}',
        )
        // insert underscore between number and letter
        .replaceAllMapped(
          RegExp(r'([0-9])([a-zA-Z])'),
          (m) => '${m[1]}_${m[2]}',
        )
        .toLowerCase();
  }
}
