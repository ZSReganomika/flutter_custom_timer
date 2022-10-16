import 'package:cherrypick/cherrypick.dart';
import 'package:flutter_timer/features/configure_timer/data/data_sources/configure_timer_data_source.dart';
import 'package:flutter_timer/features/configure_timer/data/repositories/configure_timer_repository.dart';
import 'package:flutter_timer/features/configure_timer/domain/usecases/set_custom_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/configure_timer_bloc.dart';

class ConfigureTimerModule extends Module {
  @override
  Future<void> builder(Scope currentScope) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final dataSource = ConfigureTimerDataSourceImpl(sharedPreferences);
    final repository = ConfigureTimerRepositoryImpl(dataSource: dataSource);

    final setCustomTimer = SetCustomTimer(repository);

    bind<ConfigureTimerBloc>().withName('ConfigureTimerBloc')
        .toProvide(() => ConfigureTimerBloc(setCustomTimer: setCustomTimer));
  }
}
