import 'dart:async';

import 'package:club/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../extra/colors.dart';
import '../../../extra/common_style.dart';
import '../../../extra/flutter_toast.dart';
import '../../../extra/my_utils.dart';
import '../../../widgets/button_widget.dart';
import '../otpCubit/otp_cubit.dart';
import '../otpCubit/otp_state.dart';

class OtpForm extends StatelessWidget {
  OtpForm({super.key});

  final StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: CommonAppBar(title: 'OTP Screen', appBar: AppBar(),iconButton: true),
      body: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            FlutterToast.showToast(state.exceptionError.toString());
          } else if (state.status.isSubmissionSuccess) {
          }
        },
        builder: (context, state) => Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const SizedBox(
                        height: 80,
                      ),
                      Text(
                        'Enter 4 digits verification code sent to your Email ${context.read<OtpCubit>().state.email}',
                        style: textStyleNormal,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PinCodeTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        appContext: context,
                        length: 4,
                        errorAnimationController: errorController,
                        //hasError: hasError,
                        textStyle: textStyleBold.copyWith(fontSize: 18),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        cursorColor: MyColor.black,

                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            inactiveColor: Colors.grey,
                            selectedColor: Colors.grey,
                            activeColor: Colors.grey,
                            inactiveFillColor: Colors.transparent,
                            selectedFillColor: Colors.transparent,
                            activeFillColor: Colors.transparent,
                            errorBorderColor: Colors.red),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        onCompleted: (v) {
                          context.read<OtpCubit>().onChangeOTP(v);
                        },
                        onChanged: (value) {
                          context.read<OtpCubit>().onChangeOTP(value);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: state.timerEnded
                            ? GestureDetector(
                                onTap: () {
                                  //Resend Oto send Otp Again
                                  context.read<OtpCubit>().startTimer();
                                },
                                child: const Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                      //   color: Colors.black,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Text(
                                "00:${state.start}",
                                style: textStyleNormal.copyWith(fontSize: 17),
                              ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonWidget(
                        buttonName: 'CONFIRM',
                        onTap: () {
                          if (context.read<OtpCubit>().state.otp?.length == 4) {
                            if (MyUtils.checkClickNetwork(context)) {
                              context
                                  .read<OtpCubit>()
                                  .loadData(context);
                            }
                          } else {
                            errorController!.add(ErrorAnimationType.shake);
                            FlutterToast.showToast('Please Enter Valid OTP');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            state.status.isSubmissionInProgress
                ? Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                      color: MyColor.black,
                      size: 70,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
