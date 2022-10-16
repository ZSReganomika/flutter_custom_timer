// ignore_for_file: always_use_package_imports, one_member_abstracts, constant_identifier_names, import_of_legacy_library_into_null_safe, unused_import
import 'dart:convert';
import 'package:flutter_timer/core/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/custom_timer_model.dart';

abstract class CustomTimerDataSource {
  Future<CustomTimerModel> getCustomTimer();
}

class CustomTimerDataSourceImpl implements CustomTimerDataSource {
  CustomTimerDataSourceImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<CustomTimerModel> getCustomTimer() {
    final jsonString =
        sharedPreferences.getString(StringConstants.customTimerCacheKey);
    final map = json.decode(jsonString) as Map<String, dynamic>;
    return Future.value(CustomTimerModel.fromJson(map));
  }
}
