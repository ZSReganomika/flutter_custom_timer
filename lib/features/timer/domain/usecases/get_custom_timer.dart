// ignore_for_file: always_use_package_imports, unnecessary_await_in_return

import '../../../../core/usecase/future_usecase.dart';
import '../entities/custom_timer.dart';
import '../repositories/custom_timer_repository.dart';

class GetCustomTimer implements FutureUseCase<void, CustomTimer> {
  GetCustomTimer(this.repository);

  final CustomTimerRepository repository;

  @override
  Future<CustomTimer> execute(void params) async {
    return await repository.getCustomTimer();
  }
}
