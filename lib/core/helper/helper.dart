import 'package:intl/intl.dart';

String dateFormat({required DateTime dateTime}) {
  String date = DateFormat("d MMMM, yyyy").format(dateTime);
  return date;
}

String dayFormat({required DateTime dateTime}) {
  String day = DateFormat("EEEE").format(dateTime);
  return day;
}

String timeRange({required DateTime dateTime, required DateTime dateTime2}) {
  String timeRange =
      "${DateFormat("h:mm a").format(dateTime)} - ${DateFormat("h:mm a").format(dateTime2)}";
  return timeRange;
}
