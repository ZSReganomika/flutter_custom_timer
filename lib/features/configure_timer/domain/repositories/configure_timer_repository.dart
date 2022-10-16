import '../../../timer/domain/entities/custom_timer.dart';

abstract class ConfigureTimerRepository {
  Future<void> setCustomTimer(CustomTimer timer);
}
