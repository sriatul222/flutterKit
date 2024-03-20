import 'dart:developer';
import 'package:club/extra/flutter_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../noNetwork/cubit/network_bloc.dart';
import '../noNetwork/cubit/network_state.dart';

class MyUtils {
  static bool checkClickNetwork(BuildContext context) {
    if (context.read<NetworkBloc>().state is ConnectionFailure) {
      FlutterToast.showToast("No Network");
      return false;
    } else {
      return true;
    }
  }

  static Future<void> showPrint(String msg) async {
    log(msg);
  }

  static Future<void> printLog(String msg) async {
    if (kDebugMode) {
      print(msg);
    }
  }
}
