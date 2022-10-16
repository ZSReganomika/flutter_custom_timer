import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer/app.dart';
import 'package:flutter_timer/features/configure_timer/presentation/di/configure_timer_di.dart';
import 'package:flutter_timer/features/timer/presentation/di/timer_di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CherryPick.openRootScope()
      .installModules([ConfigureTimerModule(), TimerModule()]);
  runApp(const App());
}
