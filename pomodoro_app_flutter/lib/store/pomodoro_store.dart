import 'package:mobx/mobx.dart';
part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {

  @observable
  int workTime = 0;

  @observable
  int timeOff = 0;

  @action
  void incrementWorkTime(){
    workTime++;
  }

  @action
  void decrementWorkTime(){
    workTime--;
  }

  @action
  void incrementTimeOff(){
    timeOff++;
  }

  @action
  void decrementTimeOff(){
    timeOff--;
  }


}