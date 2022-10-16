import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/features/configure_timer/presentation/bloc/configure_timer_bloc.dart';
import 'package:flutter_timer/features/configure_timer/presentation/di/configure_timer_di.dart';
import 'package:flutter_timer/features/timer/domain/entities/custom_timer.dart';
import 'package:flutter_timer/features/timer/presentation/view/timer_page.dart';

class ConfigureTimerPage extends StatelessWidget {
  ConfigureTimerPage({super.key});

  final intervalInputController = TextEditingController();
  final durationInputController = TextEditingController();

  Scope get _di => CherryPick.openRootScope();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer configuration')),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocProvider(
          create: (context) =>
              _di.resolve<ConfigureTimerBloc>(named: 'ConfigureTimerBloc'),
          child: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: _buildScrollView(context),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScrollView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            TextField(
              controller: durationInputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input a duration',
              ),
              onChanged: (value) {
                context
                    .read<ConfigureTimerBloc>()
                    .add(TimerConfigurationUpdateDurationEvent(value));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: intervalInputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input a interval',
              ),
              onChanged: (value) {
                context
                    .read<ConfigureTimerBloc>()
                    .add(TimerConfigurationUpdateIntervalEvent(value));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ConfigureTimerBloc, ConfigureTimerState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: (state is TimerConfigurationSetState)
                      ? () => openTimer(context)
                      : null,
                  child: const Text('Start timer'),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void openTimer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TimerPage()),
    );
  }
}
