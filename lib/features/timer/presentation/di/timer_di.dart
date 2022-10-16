import 'package:cherrypick/cherrypick.dart';
import 'package:flutter_timer/features/timer/data/datasources/custom_timer_data_source.dart';
import 'package:flutter_timer/features/timer/data/repositories/custom_timer_repository.dart';
import 'package:flutter_timer/features/timer/presentation/bloc/timer_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/custom_timer_repository.dart';
import '../../domain/usecases/get_custom_timer.dart';

class TimerModule extends Module {
  @override
  Future<void> builder(Scope currentScope) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final dataSource = CustomTimerDataSourceImpl(sharedPreferences);
    final repository = CustomTimerRepositoryImpl(dataSource: dataSource);

    final getCustomTimer = GetCustomTimer(repository);

    bind<TimerBloc>()
        .withName('TimerBloc')
        .toProvide(() => TimerBloc(getCustomTimer: getCustomTimer));
  }
}
