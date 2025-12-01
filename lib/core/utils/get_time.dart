List<String> shortMonthNames = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];


String getCurrentDateTime() {
  DateTime dateTime = DateTime.now();
  int hrs = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
  int mins = dateTime.minute;
  return '${dateTime.day} ${shortMonthNames[dateTime.month - 1]} ${hrs < 10 ? '0$hrs' : '$hrs'}:${mins < 10 ? '0$mins' : '$mins'} ${dateTime.hour >= 12 ? 'PM' : "AM"}';
}

String getDateTimeAfter(int days) {
  DateTime dateTime = DateTime.now().add(Duration(days: days));
  int hrs = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
  int mins = dateTime.minute;
  return '${dateTime.day} ${shortMonthNames[dateTime.month - 1]} ${hrs < 10 ? '0$hrs' : '$hrs'}:${mins < 10 ? '0$mins' : '$mins'} ${dateTime.hour >= 12 ? 'PM' : "AM"}';
}
