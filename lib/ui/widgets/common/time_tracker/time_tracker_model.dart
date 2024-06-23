import 'dart:async';

import 'package:stacked/stacked.dart';

class TimeTrackerModel extends StreamViewModel<Duration> {
  final DateTime _startTime;

  late Stream<Duration> _timerStream;

  TimeTrackerModel(this._startTime) {
    _timerStream = Stream.periodic(const Duration(seconds: 1), (count) {
      return DateTime.now().difference(_startTime) + Duration(seconds: count);
    });
  }

  String get formattedTime {
    if (data == null) return '';
    final duration = data! + DateTime.now().difference(_startTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Stream<Duration> get stream => _timerStream;
}
