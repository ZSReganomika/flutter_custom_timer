import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/features/configure_timer/domain/usecases/set_custom_timer.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';

part 'configure_timer_event.dart';
part 'configure_timer_state.dart';

class ConfigureTimerBloc
    extends Bloc<ConfigureTimerEvent, ConfigureTimerState> {

  ConfigureTimerBloc({required this.setCustomTimer})
      : super(ConfigureTimerInitialState()) {
    on<TimerConfigurationUpdateIntervalEvent>(_setInterval);
    on<TimerConfigurationUpdateDurationEvent>(_setDuration);
  }
  int? _duration;
  int? _interval;
  final SetCustomTimer setCustomTimer;

  Future<void> _setDuration(
    TimerConfigurationUpdateDurationEvent event,
    Emitter<ConfigureTimerState> emit,
  ) async {
    _duration = int.tryParse(event.duration);
    if (await _handleStates()) {
      emit(TimerConfigurationSetState());
    }
  }

  Future<void> _setInterval(
    TimerConfigurationUpdateIntervalEvent event,
    Emitter<ConfigureTimerState> emit,
  ) async {
    _interval = int.tryParse(event.interval);
    if (await _handleStates()) {
      emit(TimerConfigurationSetState());
    }
  }

  Future<bool> _handleStates() async {
    final interval = _interval;
    final duration = _duration;
    if (interval != null && duration != null) {
      final customTimer = CustomTimer(duration: duration, interval: interval);
      await setCustomTimer.execute(customTimer);
      return true;
    }
    return false;
  }
}
