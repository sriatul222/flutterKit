import 'package:club/screens/dashBoardScreen/dashBoardCubit/dashboard_cubit.dart';
import 'package:club/screens/dashBoardScreen/dashBoardUi/dashboard_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<DashBoardCubit>(
      create: (BuildContext context) => DashBoardCubit(),
      child: const DashBoardForm(),
    );
  }
}