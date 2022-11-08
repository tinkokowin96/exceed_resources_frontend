extension ParseInt on int {
  String countTime({bool format = true}) {
    Map calculateTime({required timeToCalculate, bool day = false, bool hour = false, minute = false}) {
      if (day) {
        return {'value': (timeToCalculate / 86400).floor(), 'remaining': timeToCalculate % 86400};
      } else if (hour) {
        return {'value': (timeToCalculate / 3600).floor(), 'remaining': timeToCalculate % 3600};
      } else {
        return {'value': (timeToCalculate / 60).floor(), 'remaining': timeToCalculate % 60};
      }
    }

    int? days, hours, minutes, seconds;

    if (this > 86400) {
      final calculatedDay = calculateTime(timeToCalculate: this, day: true);
      days = calculatedDay['value'];
      final calculatedHour = calculateTime(timeToCalculate: calculatedDay['remaining'], hour: true);
      hours = calculatedHour['value'];
      final calculatedMinutes = calculateTime(timeToCalculate: calculatedHour['remaining'], minute: true);
      minutes = calculatedMinutes['value'];
      seconds = calculatedMinutes['remaining'];
    } else if (this > 3600) {
      final calculatedHour = calculateTime(timeToCalculate: this, hour: true);
      hours = calculatedHour['value'];
      final calculatedMinutes = calculateTime(timeToCalculate: calculatedHour['remaining'], minute: true);
      minutes = calculatedMinutes['value'];
      seconds = calculatedMinutes['remaining'];
    } else if (this > 60) {
      final calculatedMinutes = calculateTime(timeToCalculate: this, minute: true);
      minutes = calculatedMinutes['value'];
      seconds = calculatedMinutes['remaining'];
    } else {
      seconds = this;
    }

    return format
        ? days != null
            ? '$days d  $hours h'
            : hours != null
                ? '$hours h  $minutes m'
                : minutes != null
                    ? '$minutes m  $seconds s'
                    : '$seconds s'
        : '${days == null ? '' : '${days < 10 ? '0$days' : days} : '}${hours == null ? '' : '${hours < 10 ? '0$hours' : hours} : '}${minutes == null ? '' : '${minutes < 10 ? '0$minutes' : minutes} : '}${seconds! < 10 ? '0$seconds' : seconds}';
  }
}
