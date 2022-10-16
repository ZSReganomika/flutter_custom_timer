part of 'configure_timer_bloc.dart';

abstract class ConfigureTimerState extends Equatable {
  const ConfigureTimerState();

  @override
  List<Object> get props => [];
}

class ConfigureTimerInitialState extends ConfigureTimerState {}
class TimerConfigurationSetState extends ConfigureTimerState {}
