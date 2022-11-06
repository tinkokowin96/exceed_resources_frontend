extension ParseInt on int {
  String countTime() {
    Map calculateTime({required timeToCalculate, bool day = false, bool hour = false, minute = false}) {
      if (day) {
        return {'value': (timeToCalculate / 60 * 60 * 24).floor(), 'remaining': timeToCalculate % 60 * 60 * 24};
      } else if (hour) {
        return {'value': (timeToCalculate / 60 * 60).floor(), 'remaining': timeToCalculate % 60 * 60};
      } else {
        return {'value': (timeToCalculate / 60).floor(), 'remaining': timeToCalculate % 60};
      }
    }

    int? days, hours, minutes, seconds;

    if (this > 60 * 60 * 24) {
      final calculatedDay = calculateTime(timeToCalculate: this, day: true);
      days = calculatedDay['value'];
      final calculatedHour = calculateTime(timeToCalculate: calculatedDay['remaining'], hour: true);
      hours = calculatedHour['value'];
      final calculatedMinutes = calculateTime(timeToCalculate: calculatedHour['remaining'], minute: true);
      minutes = calculatedMinutes['value'];
      seconds = calculatedMinutes['remaining'];
    } else if (this > 60 * 60) {
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

    return '${days == null ? '' : '${days < 10 ? '0$days' : days} : '}${hours == null ? '' : '${hours < 10 ? '0$hours' : hours} : '}${minutes == null ? '' : '${minutes < 10 ? '0$minutes' : minutes} : '}${seconds! < 10 ? '0$seconds' : seconds}';
  }
}
