extension ParseDateTime on DateTime {
  String formatTime() =>
      '${hour < 10 ? '0$hour' : hour} : ${minute < 10 ? '0$minute' : minute} ${hour > 12 ? ' pm' : ' am'}';

  String formatDate() {
    String formattedDate = '$day ';
    switch (month) {
      case 1:
        formattedDate = 'Jan';
        break;
      case 2:
        formattedDate = 'Feb';
        break;
      case 3:
        formattedDate = 'Mar';
        break;
      case 4:
        formattedDate = 'Apr';
        break;
      case 5:
        formattedDate = 'May';
        break;
      case 6:
        formattedDate = 'Jun';
        break;
      case 7:
        formattedDate = 'Jul';
        break;
      case 8:
        formattedDate = 'Aug';
        break;
      case 9:
        formattedDate = 'Sep';
        break;
      case 10:
        formattedDate = 'Oct';
        break;
      case 11:
        formattedDate = 'Nov';
        break;
      case 12:
        formattedDate = 'Dec';
        break;
    }
    return '$formattedDate $year';
  }
}
