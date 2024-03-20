import 'package:club/extra/colors.dart';
import 'package:club/extra/my_utils.dart';
import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_cubit.dart';
import 'package:club/screens/editProfileScreen/editProfileCubit/edit_profile_state.dart';
import 'package:club/screens/editProfileScreen/editProfileUi/change_image_ui.dart';
import 'package:club/widgets/button_widget.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:club/widgets/hint_text.dart';
import 'package:club/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditProfileForm extends StatelessWidget {
   EditProfileForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: CommonAppBar(title: 'Edit Profile Screen', appBar: AppBar(),iconButton: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const ChangeImageScreen(),
                      const SizedBox(
                        height: 50,
                      ),
                      const HintText(
                        hint: 'Name*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _SelfNameInputField(),
                      const SizedBox(
                        height: 15,
                      ),
                      const HintText(
                        hint: 'Mobile*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _SelfMobileInputField(),
                      const SizedBox(
                        height: 15,
                      ),
                      const HintText(
                        hint: 'Email*',
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      _SelfEmailInputField(),
                      const SizedBox(
                        height: 80,
                      ),
                      ButtonWidget(
                        buttonName: 'Update Profile',
                        onTap: () {
                          if (_formKey.currentState!.validate() && MyUtils.checkClickNetwork(context)) {
                            context.read<EditProfileCubit>().loadData(context);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                    builder: (context, state) {
                      return state.status.isSubmissionInProgress
                          ? Container(
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: MyColor.black,
                          size: 70,
                        ),
                      )
                          : Container();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _SelfNameInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit,EditProfileState>(
      builder: (context,state){
        return TextInputFields(
          textEditingController: state.textControllerName,
          validator: (name) {
            return context.read<EditProfileCubit>().nameChanged(name);
          },
          onChanged: (name) {
            context.read<EditProfileCubit>().nameChanged(name);
          },
        );
      },
    );
  }
}

class _SelfMobileInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit,EditProfileState>(
      builder: (context,state){
        return TextInputFields(
          textEditingController: state.textControllerMobile,
          textInputType: TextInputType.number,
          maxLength: 10,
          validator: (mobile) {
            return context.read<EditProfileCubit>().mobileChanged(mobile);
          },
          onChanged: (mobile) {
            context.read<EditProfileCubit>().mobileChanged(mobile);
          },
        );
      },
    );
  }
}

class _SelfEmailInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit,EditProfileState>(
      builder: (context,state){
        return TextInputFields(
          textEditingController: state.textControllerEmail,
          validator: (email) {
            return context.read<EditProfileCubit>().emailChanged(email);
          },
          onChanged: (email) {
            context.read<EditProfileCubit>().emailChanged(email);
          },
        );
      },
    );
  }
}

