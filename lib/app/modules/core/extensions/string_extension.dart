extension ParseString on String {
  bool parseBool() => toLowerCase() == 'true';

  String firstCharCaptilize() => this[0].toUpperCase() + RegExp(r' (.)').firstMatch(this)!.group(1)!.toUpperCase();

  String firstCapitalize() => "${this[0].toUpperCase()}${substring(1)}";
  String firstOnlyCapitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
