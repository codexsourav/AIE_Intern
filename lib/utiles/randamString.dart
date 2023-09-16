import 'dart:math';

String generateRandomString(int length) {
  final random = Random();

  // Characters for the random part of the string
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  // Generate a random part of the string
  final randomString = String.fromCharCodes(Iterable.generate(
    length - 14, // Subtracting 14 to make room for the date-time part
    (_) => chars.codeUnitAt(random.nextInt(chars.length)),
  ));

  // Generate the date-time part of the string
  final now = DateTime.now();
  final dateTimeString =
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}';

  // Combine both parts to get the final random string
  final randomResult = '$dateTimeString$randomString';

  return randomResult;
}
