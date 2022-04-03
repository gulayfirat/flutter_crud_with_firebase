import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  bool isSwitched = false;
  changeSwitched(val) {
    isSwitched = val;
    emit(changeSwitch());
  }
}
