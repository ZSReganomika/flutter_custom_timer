// ignore_for_file: unnecessary_await_in_return

import 'package:flutter_timer/features/timer/data/datasources/custom_timer_data_source.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';
import 'package:flutter_timer/features/timer/domain/repositories/custom_timer_repository.dart';

class CustomTimerRepositoryImpl implements CustomTimerRepository {
  CustomTimerRepositoryImpl({required this.dataSource});

  final CustomTimerDataSource dataSource;

  @override
  Future<CustomTimer> getCustomTimer() async {
    return await dataSource.getCustomTimer();
  }
}
