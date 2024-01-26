import 'package:intl/intl.dart';

String getTime(String time) {
  var dateValue = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parseUTC(time).toLocal();
  return DateFormat("dd MMM yyyy hh:mm").format(dateValue);
}
