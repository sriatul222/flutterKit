import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_cubit.dart';
import 'package:club/screens/editProfileScreen/editProfileUi/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<EditProfileCubit>(
      create: (BuildContext context) => EditProfileCubit(),
      child: EditProfileForm(),
    );
  }
}