class DatesUtils {
  static String formatDate(DateTime dateTime) {
    if (dateTime == null) return '';
    String day = numToZeroPaddedString(dateTime.day);
    String month = numToZeroPaddedString(dateTime.month);
    String year = numToZeroPaddedString(dateTime.year);
    return "$day/$month/$year";
  }

  static String numToZeroPaddedString(num number) {
    return number.toString().padLeft(2, "0");
  }
}
