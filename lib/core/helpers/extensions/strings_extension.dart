extension StringExtension on String {
  String get capitalize {
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String get convertToShortString {
    return length > 30 ? '${substring(0, 25)}...' : this;
  }
}
