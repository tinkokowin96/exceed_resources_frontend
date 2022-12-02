extension ParseDateTime on DateTime {
  String formatTime() =>
      '${hour < 10 ? '0$hour' : hour > 12 ? hour - 12 : hour} : ${minute < 10 ? '0$minute' : minute} ${hour > 12 ? ' pm' : ' am'}';

  String formatDate({bool short = true}) {
    String formattedDate = '${day < 10 ? '0$day' : day} ';
    String wday = '';
    switch (month) {
      case 1:
        formattedDate += short ? 'Jan' : 'January';
        break;
      case 2:
        formattedDate += short ? 'Feb' : 'February';
        break;
      case 3:
        formattedDate += short ? 'Mar' : 'March';
        break;
      case 4:
        formattedDate += short ? 'Apr' : 'April';
        break;
      case 5:
        formattedDate += 'May';
        break;
      case 6:
        formattedDate += short ? 'Jun' : 'June';
        break;
      case 7:
        formattedDate += short ? 'Jul' : 'July';
        break;
      case 8:
        formattedDate += short ? 'Aug' : 'August';
        break;
      case 9:
        formattedDate += short ? 'Sep' : 'September';
        break;
      case 10:
        formattedDate += short ? 'Oct' : 'October';
        break;
      case 11:
        formattedDate += short ? 'Nov' : 'November';
        break;
      case 12:
        formattedDate += short ? 'Dec' : 'December';
        break;
    }
    formattedDate += ' $year';

    switch (weekday) {
      case 1:
        wday = 'Monday';
        break;
      case 2:
        wday = 'Tueday';
        break;
      case 3:
        wday = 'Wednesday';
        break;
      case 4:
        wday = 'Thursday';
        break;
      case 5:
        wday = 'Friday';
        break;
      case 6:
        wday = 'Saturday';
        break;
      case 7:
        wday = 'Sunday';
        break;
    }
    if (!short) formattedDate += ', $wday';
    return formattedDate;
  }
}
