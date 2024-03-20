import 'package:club/screens/settingScreen/settingCubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(const SettingState());
  void nightMode(nightModeFlag) async {
    if (state.nightMode) {
      emit(state.copyWith(nightMode: nightModeFlag));
    } else {
      emit(state.copyWith(nightMode: nightModeFlag));
    }
  }
}