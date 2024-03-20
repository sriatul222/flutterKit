import 'package:club/screens/changePasswordScreen/changePasswordUi/change_password_screen.dart';
import 'package:club/screens/cmsScreen/cmsUi/cms_screen.dart';
import 'package:club/screens/dashBoardScreen/dashBoardUi/dashboard_screen.dart';
import 'package:club/screens/editProfileScreen/editProfileUi/edit_profile_screen.dart';
import 'package:club/screens/forgetPasswordScreen/forgetPasswordUi/forget_screen.dart';
import 'package:club/screens/loginScreen/loginUi/login_screen.dart';
import 'package:club/screens/otpPage/otpUi/otp_screen.dart';
import 'package:club/screens/registerScreen/registerUi/register_screen.dart';
import 'package:club/screens/resetPasswordScreen/resetPasswordUi/reset_password_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class RouteHandlers {
  static Handler loginPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const LoginScreen());
  static Handler forgetPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ForgetScreen());
  static Handler newPasswordPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const NewPasswordScreen());
  static Handler registerPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const RegisterScreen());
  static Handler otpHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const OtpScreen());
  static Handler cmsHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const CmsScreen());
  static Handler dashBoardHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const DashBoardScreen());
  static Handler editProfileHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const EditProfileScreen());
  static Handler changePasswordHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ChangePasswordScreen());
}
