// ignore_for_file: always_use_package_imports
import '../../domain/entities/custom_timer.dart';

class CustomTimerModel extends CustomTimer {
  const CustomTimerModel({required super.duration, required super.interval});

  factory CustomTimerModel.fromJson(Map<String, dynamic> json) {
    return CustomTimerModel(
      duration: (json['duration'] as num).toInt(),
      interval: (json['interval'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'interval': interval,
    };
  }
}
