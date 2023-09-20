String? changeTimeToDayOrHour(String? date) {
  if (date != null) {
    DateTime? parsedDate = DateTime.tryParse(date);

    if (parsedDate != null) {
      DateTime currentDate = DateTime.now();
      Duration difference = currentDate.difference(parsedDate);

      if (difference.inDays >= 365) {
        int years = (difference.inDays / 365).floor();
        return '$years year${years > 1 ? 's' : ''}';
      } else if (difference.inDays >= 30) {
        int months = (difference.inDays / 30).floor();
        return '$months month${months > 1 ? 's' : ''}';
      } else if (difference.inHours >= 1) {
        int hours = difference.inHours;
        return '$hours hour${hours > 1 ? 's' : ''}';
      } else if (difference.inMinutes >= 1) {
        int minutes = difference.inMinutes;
        return '$minutes min${minutes > 1 ? 's' : ''}';
      } else {
        int seconds = difference.inSeconds;
        return '$seconds sec${seconds > 1 ? 's' : ''}';
      }
    }
  }

  return null; // Return null if date is null or couldn't be parsed
}
