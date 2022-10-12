class DropdownOption {
  final String text;
  final dynamic value;
  final String? category;

  const DropdownOption({
    required this.text,
    required this.value,
    this.category,
  });
}
