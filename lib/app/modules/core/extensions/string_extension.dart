extension ParseString on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}
