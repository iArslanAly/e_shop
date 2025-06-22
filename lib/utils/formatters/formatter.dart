import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatter {
  // ----------- Existing Formatters -----------

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);
    final formattedNumber = StringBuffer('($countryCode) ');
    for (int i = 0; i < digitsOnly.length; i += 2) {
      formattedNumber.write(
        digitsOnly.substring(i, i + 2 > digitsOnly.length ? digitsOnly.length : i + 2),
      );
      if (i + 2 < digitsOnly.length) formattedNumber.write(' ');
    }
    return formattedNumber.toString();
  }

  static String formatEmail(String email) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    return emailRegex.hasMatch(email) ? email.toLowerCase() : 'Invalid email';
  }

  static String formatPassword(String password) {
    if (password.length <= 2) return '*' * password.length;
    return '*' * (password.length - 2) + password.substring(password.length - 2);
  }

  static String formatPercentage(double value) {
    return NumberFormat.percentPattern().format(value);
  }

  static String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  static String formatDuration(Duration duration) {
    return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s';
  }

  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  static String formatDistance(double meters) {
    return meters < 1000 ? '${meters.toStringAsFixed(2)} m' : '${(meters / 1000).toStringAsFixed(2)} km';
  }

  static String formatRating(double rating) => rating.toStringAsFixed(1);

  static String formatUrl(String url) {
    final urlRegex = RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$');
    return urlRegex.hasMatch(url) ? url : 'Invalid URL';
  }

  static String formatAddress(String address) {
    return address.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  static String formatCreditCardNumber(String cardNumber) {
    final digitsOnly = cardNumber.replaceAll(RegExp(r'\D'), '');
    return List.generate((digitsOnly.length / 4).ceil(), (i) {
      final start = i * 4;
      final end = (start + 4 < digitsOnly.length) ? start + 4 : digitsOnly.length;
      return digitsOnly.substring(start, end);
    }).join(' ');
  }

  static String formatPostalCode(String postalCode) {
    return postalCode.trim().toUpperCase();
  }

  static String formatUUID(String uuid) {
    final uuidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
    );
    return uuidRegex.hasMatch(uuid) ? uuid.toLowerCase() : 'Invalid UUID';
  }

  // ----------- 🔥 New Formatters -----------

  static String formatTimestamp(int millisecondsSinceEpoch) {
    return DateFormat('dd MMM yyyy, hh:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
  }

  static String formatBool(bool value, {String trueLabel = 'Yes', String falseLabel = 'No'}) {
    return value ? trueLabel : falseLabel;
  }

  static String formatJson(Map<String, dynamic> json, {bool pretty = true}) {
    return pretty ? const JsonEncoder.withIndent('  ').convert(json) : jsonEncode(json);
  }

  static String formatInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0].toUpperCase()}${parts[1][0].toUpperCase()}';
  }

  static String formatShortNumber(int value) {
    if (value >= 1000000000) return '${(value / 1000000000).toStringAsFixed(1)}B';
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    return value.toString();
  }

  static String formatHexColor(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  static String formatEnum(Enum value) {
    return value.toString().split('.').last;
  }
  // Returns a username-style string like @john_doe
static String formatUsername(String name) {
  return '@' + name.trim().toLowerCase().replaceAll(RegExp(r'\s+'), '_');
}

// Adds ordinal suffix: 1 → 1st, 2 → 2nd, 3 → 3rd...
static String formatOrdinal(int number) {
  if (number >= 11 && number <= 13) return '${number}th';
  switch (number % 10) {
    case 1:
      return '${number}st';
    case 2:
      return '${number}nd';
    case 3:
      return '${number}rd';
    default:
      return '${number}th';
  }
}

// Title case: hello world → Hello World
static String toTitleCase(String text) {
  if (text.isEmpty) return '';
  return text
      .split(' ')
      .map((word) => word.isNotEmpty
          ? word[0].toUpperCase() + word.substring(1).toLowerCase()
          : '')
      .join(' ');
}

// Slugify: My Title → my-title
static String slugify(String text) {
  return text
      .toLowerCase()
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(RegExp(r'\s+'), '-')
      .replaceAll(RegExp(r'-+'), '-');
}

// Remove all non-alphanumeric characters
static String removeSpecialCharacters(String input) {
  return input.replaceAll(RegExp(r'[^\w\s]'), '');
}

// Short duration in hh:mm:ss
static String formatDurationShort(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  return '${twoDigits(duration.inHours)}:${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';
}

// Pluralization: 1 apple, 2 apples
static String pluralize(String word, int count) {
  return count == 1 ? '$count $word' : '$count ${word}s';
}

// Currency without symbol: 123456 → 123,456.00
static String formatCurrencyPlain(double amount) {
  return NumberFormat('#,##0.00', 'en_US').format(amount);
}

// Mask email: j***@gmail.com
static String maskEmail(String email) {
  final parts = email.split('@');
  if (parts.length != 2) return 'Invalid email';
  final name = parts[0];
  final masked = name.length > 1 ? '${name[0]}***' : '*';
  return '$masked@${parts[1]}';
}

// Mask phone: 03******90
static String maskPhone(String phone) {
  if (phone.length < 4) return '*' * phone.length;
  final start = phone.substring(0, 2);
  final end = phone.substring(phone.length - 2);
  return '$start${'*' * (phone.length - 4)}$end';
}

// Compact JSON (single line)
static String formatCompactJson(Map<String, dynamic> json) {
  return jsonEncode(json);
}
  // Converts a list of strings to a comma-separated string
  static String formatListToString(List<String> list) {
    return list.join(', ');
  }

  // Converts a map to a string representation
  static String formatMapToString(Map<String, dynamic> map) {
    return map.entries.map((e) => '${e.key}: ${e.value}').join(', ');
  }

  // Formats a date to a human-readable string
  static String formatHumanReadableDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
