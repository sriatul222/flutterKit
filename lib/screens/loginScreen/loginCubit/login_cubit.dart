import 'package:club/extra/common_validator.dart';
import 'package:club/routes/routes_name.dart';
import 'package:club/screens/loginScreen/loginCubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  String? passwordChanged(String? value) {
    final password = InputValidation.validatePassword(
        value ?? '', 'Please enter Valid Password');
    emit(state.copyWith(
      password: value,
    ));
    return password;
  }

  String? emailChanged(String? value) {
    final email =
        InputValidation.validateEmail(value ?? '', 'Please enter Valid E-mail');
    emit(state.copyWith(
      email: value,
    ));
    return email;
  }

  Future googleLogin(context) async {
    debugPrint('Google Login');
   // emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredentialData =
      await FirebaseAuth.instance.signInWithCredential(credential);
      //  emit(state.copyWith(status: FormzStatus.submissionSuccess));
        loadData(context);
    } catch (e) {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.dashBoardScreen, (Route<dynamic> route) => false);
     // emit(state.copyWith(status: FormzStatus.submissionFailure, error: e.toString()));
    }
  }

  Future appleLogin(context) async {
   // emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      final userCredentialData =
      await FirebaseAuth.instance.signInWithCredential(credential);
      //  emit(state.copyWith(status: FormzStatus.submissionSuccess));
        loadData(context);

    } catch (e) {
     // emit(state.copyWith(status: FormzStatus.submissionFailure, error: e.toString()));
    }
  }

  void loadData(context) {
    Navigator.pushNamed(context, RoutesName.otp,
        arguments: {"email": state.email});
  }
}
