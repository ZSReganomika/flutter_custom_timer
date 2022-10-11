import 'package:flutter_timer/core/usecase/future_usecase.dart';

// ignore: always_use_package_imports
import '../repositories/duration_repository.dart';

class GetDuration implements FutureUseCase<void, Duration> {
  GetDuration(this.repository);

  final DurationRepository repository;

  @override
  Future<Duration> execute(void params) async {
    // ignore: unnecessary_await_in_return
    return await repository.getDuration();
  }
}
