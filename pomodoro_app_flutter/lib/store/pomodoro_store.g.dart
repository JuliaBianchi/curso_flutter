// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PomodoroStore on _PomodoroStore, Store {
  late final _$workTimeAtom =
      Atom(name: '_PomodoroStore.workTime', context: context);

  @override
  int get workTime {
    _$workTimeAtom.reportRead();
    return super.workTime;
  }

  @override
  set workTime(int value) {
    _$workTimeAtom.reportWrite(value, super.workTime, () {
      super.workTime = value;
    });
  }

  late final _$timeOffAtom =
      Atom(name: '_PomodoroStore.timeOff', context: context);

  @override
  int get timeOff {
    _$timeOffAtom.reportRead();
    return super.timeOff;
  }

  @override
  set timeOff(int value) {
    _$timeOffAtom.reportWrite(value, super.timeOff, () {
      super.timeOff = value;
    });
  }

  late final _$_PomodoroStoreActionController =
      ActionController(name: '_PomodoroStore', context: context);

  @override
  void incrementWorkTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.incrementWorkTime');
    try {
      return super.incrementWorkTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementWorkTime() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.decrementWorkTime');
    try {
      return super.decrementWorkTime();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementTimeOff() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.incrementTimeOff');
    try {
      return super.incrementTimeOff();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementTimeOff() {
    final _$actionInfo = _$_PomodoroStoreActionController.startAction(
        name: '_PomodoroStore.decrementTimeOff');
    try {
      return super.decrementTimeOff();
    } finally {
      _$_PomodoroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workTime: ${workTime},
timeOff: ${timeOff}
    ''';
  }
}
