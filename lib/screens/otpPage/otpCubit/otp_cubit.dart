import 'dart:async';
import 'package:club/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(String email) : super(OtpState(email: email));

  Timer? timer;

  void startTimer() async {
    timer?.cancel();
    int timerTime = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerTime--;
      if (timerTime > 0) {
        emit(state.copyWith(
            timerEnded: false, start: timerTime, status: FormzStatus.pure));
      } else {
        emit(state.copyWith(timerEnded: true, status: FormzStatus.pure));
        this.timer?.cancel();
      }
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }

  void onChangeOTP(String? value) {
    emit(state.copyWith(otp: value, status: FormzStatus.pure));
  }

  void loadData(context) {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2)).then((_) => {
          emit(state.copyWith(status: FormzStatus.submissionSuccess)),
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.dashBoardScreen, (Route<dynamic> route) => false)
        });
  }
}
