part of 'configure_timer_bloc.dart';

abstract class ConfigureTimerEvent extends Equatable {
  const ConfigureTimerEvent();

  @override
  List<Object> get props => [];
}

class TimerConfigurationUpdateDurationEvent extends ConfigureTimerEvent {
  const TimerConfigurationUpdateDurationEvent(this.duration);

  final String duration;
}

class TimerConfigurationUpdateIntervalEvent extends ConfigureTimerEvent {
  const TimerConfigurationUpdateIntervalEvent(this.interval);

  final String interval;
}