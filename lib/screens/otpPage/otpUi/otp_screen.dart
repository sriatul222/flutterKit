import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../otpCubit/otp_cubit.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    return BlocProvider<OtpCubit>(
        create: (BuildContext context) => OtpCubit(args["email"] ?? "")..startTimer(),
        child: OtpForm());
  }
}
