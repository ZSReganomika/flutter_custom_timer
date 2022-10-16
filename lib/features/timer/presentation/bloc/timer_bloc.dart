import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_timer/core/ticker.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';
import 'package:flutter_timer/features/timer/domain/usecases/get_custom_timer.dart';

import '../../../../core/usecase/future_usecase.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final GetCustomTimer getCustomTimer;

  TimerBloc({required this.getCustomTimer})
      : super(const TimerInitialState(0)) {
    on<TimerStartedEvent>(_onStarted);
    on<TimerPausedEvent>(_onPaused);
    on<TimerResumedEvent>(_onResumed);
    on<TimerResetEvent>(_onReset);
    on<TimerTickedEvent>(_onTicked);
  }

  late Ticker _ticker;
  late CustomTimer _cutomTimer;
  bool _isCustomTimerDataFetched = false;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Future<void> _onStarted(
      TimerStartedEvent event, Emitter<TimerState> emit) async {
    if (!_isCustomTimerDataFetched) {
      _cutomTimer = await getCustomTimer.execute(NoParams());
      _ticker = Ticker(_cutomTimer.interval, _cutomTimer.duration);
      _isCustomTimerDataFetched = true;
    }
    emit(TimerRunInProgressState(_cutomTimer.duration));
    await _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick()
        .listen((duration) => add(TimerTickedEvent(duration: duration)));
  }

  void _onPaused(TimerPausedEvent event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgressState) {
      _tickerSubscription?.pause();
      emit(TimerRunPauseState(state.duration));
    }
  }

  void _onResumed(TimerResumedEvent resume, Emitter<TimerState> emit) {
    if (state is TimerRunPauseState) {
      _tickerSubscription?.resume();
      emit(TimerRunInProgressState(state.duration));
    }
  }

  void _onReset(TimerResetEvent event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();
    emit(TimerInitialState(_cutomTimer.duration));
  }

  void _onTicked(TimerTickedEvent event, Emitter<TimerState> emit) {
    emit(
      event.duration > 0
          ? TimerRunInProgressState(event.duration)
          : const TimerRunCompleteState(),
    );
  }
}
