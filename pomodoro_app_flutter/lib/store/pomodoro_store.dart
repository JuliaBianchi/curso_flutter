import 'dart:async';
import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum BreakType { WORK, TIMEOFF }

abstract class _PomodoroStore with Store {

  @observable
  bool started = false;

  @observable
  int minutes = 0;

  @observable
  int seconds = 0;

  @observable
  int workTime = 0;

  @observable
  int timeOff = 0;

  @observable
  BreakType breakType = BreakType.WORK;

  Timer? stopwatch;

  @action
  void start() {
    started = true;
    stopwatch = Timer.periodic(const Duration(seconds: 1), (timer) {

      if(minutes == 0 && seconds == 0){
        _changeBreakType();
      }else if(seconds == 0){
        seconds = 59;
        minutes--;
      }else{
        seconds--;
      }
    });
  }

  @action
  void stop() {
    started = false;
    stopwatch?.cancel();
  }

  @action
  void refresh() {
    stop();
    minutes = isWorking() ? workTime : timeOff;
    seconds = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;
    if(isWorking()){
      refresh();
    }
  }

  @action
  void decrementWorkTime() {

    if(workTime >1){
      workTime--;

      if(isWorking()){
        refresh();
      }
    }
  }

  @action
  void incrementTimeOff() {
    timeOff++;

    if(isTimeOff()){
      refresh();
    }
  }

  @action
  void decrementTimeOff() {
    if(timeOff > 1){
      timeOff--;

      if(isTimeOff()){
        refresh();
      }
    }
  }

  bool isWorking() {
    return breakType == BreakType.WORK;
  }

  bool isTimeOff() {
    return breakType == BreakType.TIMEOFF;
  }

  void _changeBreakType(){
    if (isWorking()){
      breakType = BreakType.TIMEOFF;
      minutes = timeOff;
    }else{
      breakType = BreakType.WORK;
      minutes = workTime;
    }
    seconds = 0;
  }

}