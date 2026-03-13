/// Utility helper functions used across the application.
///
/// Add general-purpose helper methods here that do not belong
/// to a specific feature module.
class Helpers {
  Helpers._();

  /// Formats a [DateTime] to a human-readable string (e.g., "Mar 14, 2026").
  static String formatDate(DateTime date) {
    const List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  /// Truncates a [text] to the given [maxLength] and appends "..." if needed.
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }
}
