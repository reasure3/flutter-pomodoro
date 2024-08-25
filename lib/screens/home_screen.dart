import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int initSeconds = 1500;
  int _totalSeconds = initSeconds;
  bool _isRunning = false;
  int _totalPomodoros = 0;
  late Timer _timer;

  void onTick(Timer timer) => setState(() {
        if (--_totalSeconds <= 0) {
          timer.cancel();
          _totalPomodoros++;
          _isRunning = false;
          _totalSeconds = initSeconds;
        }
      });

  void onStartPressed() {
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      _isRunning = true;
    });
  }

  void onPausePressed() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    var min = '${duration.inMinutes.remainder(60)}'.padLeft(2, '0');
    var sec = '${duration.inSeconds.remainder(60)}'.padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(_totalSeconds),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: _isRunning
                  ? IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: onPausePressed,
                      icon: const Icon(Icons.pause_circle_outline_rounded))
                  : IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: onStartPressed,
                      icon: const Icon(Icons.play_circle_outline_rounded)),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.pomodoro,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text(
                          '$_totalPomodoros',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
