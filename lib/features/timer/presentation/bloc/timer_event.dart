part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class TimerStartedEvent extends TimerEvent {
  const TimerStartedEvent();
}

class TimerPausedEvent extends TimerEvent {
  const TimerPausedEvent();
}

class TimerResumedEvent  extends TimerEvent {
  const TimerResumedEvent();
}

class TimerResetEvent  extends TimerEvent {
  const TimerResetEvent();
}

class TimerTickedEvent  extends TimerEvent {
  const TimerTickedEvent({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
