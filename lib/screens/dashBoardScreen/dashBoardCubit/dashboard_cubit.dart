import 'package:club/screens/dashBoardScreen/dashBoardCubit/dashboard_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit() : super(DashBoardState(pageController: PageController()));

  void onPageChanged(int page) {
    emit(state.copyWith(currentTab: page));
  }

}