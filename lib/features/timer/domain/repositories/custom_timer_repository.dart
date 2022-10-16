// ignore_for_file: one_member_abstracts, always_use_package_imports

import '../entities/custom_timer.dart';

abstract class CustomTimerRepository {
  Future<CustomTimer> getCustomTimer();
}
