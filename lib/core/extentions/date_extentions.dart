// extension DateTimeX on DateTime {
//   bool get isExpired => isBefore(DateTime.now());

//   bool get isToday {
//     final now = DateTime.now();
//     return year == now.year && month == now.month && day == now.day;
//   }

//   String toFormatted() {
//     return "$day/$month/$year";
//   }

//   String timeAgo() {
//     final diff = DateTime.now().difference(this);

//     if (diff.inDays > 0) return "${diff.inDays}d ago";
//     if (diff.inHours > 0) return "${diff.inHours}h ago";
//     if (diff.inMinutes > 0) return "${diff.inMinutes}m ago";
//     return "Just now";
//   }
// }
