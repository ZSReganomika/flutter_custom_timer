import 'dart:convert';

import 'package:flutter_timer/core/string_constants.dart';
import 'package:flutter_timer/core/string_constants.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../timer/data/models/custom_timer_model.dart';

abstract class ConfigureTimerDataSource {
  Future<void> setCustomTimer(CustomTimerModel timer);
}

class ConfigureTimerDataSourceImpl implements ConfigureTimerDataSource {
  ConfigureTimerDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<void> setCustomTimer(CustomTimerModel timer) async {
    await sharedPreferences.setString(
        StringConstants.customTimerCacheKey, json.encode(timer.toJson()),);
  }
}
