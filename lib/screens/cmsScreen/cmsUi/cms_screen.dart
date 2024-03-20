import 'package:club/screens/cmsScreen/cmsCubit/cms_cubit.dart';
import 'package:club/screens/cmsScreen/cmsUi/cms_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CmsScreen extends StatelessWidget {
  const CmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider<CmsCubit>(
      create: (BuildContext context) => CmsCubit(),
      child: const CmsForm(),
    );
  }
}