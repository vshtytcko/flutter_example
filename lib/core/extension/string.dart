extension StringExtension on String {
  String cap() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  // String upperfirst(String text) {
  //   if (text == null || text.isEmpty) return text;
  //   return '${text[0].toUpperCase()}${text.substring(1)}';
  // }
}
