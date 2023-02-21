extension StringExtensions on String {
  bool containsIgnoreCase(String other) =>
      toLowerCase().contains(other.toLowerCase());
  String toInitials() {
    final init = trim();
    final ar = init.split(' ').where((s) => s.isNotEmpty);
    return init.isEmpty
        ? '.'
        : ar.isEmpty
            ? substring(0, 1)
            : ar.map((str) => str.toUpperCase().substring(0, 1)).join();
  }
}
