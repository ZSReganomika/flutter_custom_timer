import '../../../../core/usecase/future_usecase.dart';
import '../../../timer/domain/entities/custom_timer.dart';
import '../repositories/configure_timer_repository.dart';

class SetCustomTimer implements FutureUseCase<CustomTimer, void> {
  SetCustomTimer(this.repository);

  final ConfigureTimerRepository repository;

  @override
  Future<void> execute(CustomTimer params) async {
    await repository.setCustomTimer(params);
  }
}
