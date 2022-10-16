import '../features/timer/domain/entities/custom_timer.dart';

class Ticker {
  Ticker(this.interval, this.duration);

  factory Ticker.fromCustomTimer(CustomTimer timer) {
    return Ticker(timer.interval, timer.duration);
  }

  final int interval;
  final int duration;

  Stream<int> tick() {
    return Stream.periodic(Duration(seconds: interval), (x) => duration - x - 1)
        .take(duration);
  }
}
