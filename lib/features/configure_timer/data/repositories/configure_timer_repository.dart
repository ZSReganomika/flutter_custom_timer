import 'package:flutter_timer/features/configure_timer/data/data_sources/configure_timer_data_source.dart';
import 'package:flutter_timer/features/configure_timer/domain/repositories/configure_timer_repository.dart';
import 'package:flutter_timer/features/timer/data/models/custom_timer_model.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';

class ConfigureTimerRepositoryImpl implements ConfigureTimerRepository {
  ConfigureTimerRepositoryImpl({required this.dataSource});

  final ConfigureTimerDataSource dataSource;

  @override
  Future<void> setCustomTimer(CustomTimer timer) async {
    final model =
        CustomTimerModel(duration: timer.duration, interval: timer.interval);
    await dataSource.setCustomTimer(model);
  }
}
