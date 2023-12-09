import 'package:intl/intl.dart';

class DateFormatter {
  String dayMonthYear(String input) {
    DateTime dateTime = DateTime.parse(input);
    return DateFormat('d MMMM yyyy').format(dateTime);
  }

  String dayTime(String input) {
    DateTime dateTime = DateTime.parse(input);
    String formattedDay = DateFormat('EEEE').format(dateTime);
    String formattedTime = DateFormat('h:mm a').format(dateTime);
    DateTime endDateTime = dateTime.add(const Duration(hours: 2));
    String formattedEndTime = DateFormat('h:mm a').format(endDateTime);
    
    return '$formattedDay, $formattedTime - $formattedEndTime';
  }
  homeTileDateTime(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      String formattedDate = DateFormat('E, MMM d • h:mm a').format(dateTime);
      return formattedDate;
    }
}