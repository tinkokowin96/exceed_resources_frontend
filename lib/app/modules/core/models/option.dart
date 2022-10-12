class Option {
  final String text;
  final dynamic value;
  final String? category;

  const Option({
    required this.text,
    required this.value,
    this.category,
  });
}
