extension ParseString on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }

  String firstCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
