import 'package:club/screens/homeScreen/homeCubit/home_cubit.dart';
import 'package:club/screens/homeScreen/homeUi/home_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(),
      child: const HomeForm(),
    );
  }
}