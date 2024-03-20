import 'dart:async';
import 'package:club/screens/cmsScreen/cmsCubit/cms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CmsCubit extends Cubit<CmsState> {
  CmsCubit() : super(CmsState(webController: Completer<WebViewController>()));

  handleLoad() {
    emit(state.copyWith(indexStack: 0));
  }
}
