import 'package:club/screens/cmsScreen/cmsCubit/cms_cubit.dart';
import 'package:club/screens/cmsScreen/cmsCubit/cms_state.dart';
import 'package:club/widgets/common_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CmsForm extends StatelessWidget {
  const CmsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    return Scaffold(
        appBar: CommonAppBar(title: args["screenName"]??'', appBar: AppBar(),iconButton: true),
        body: BlocBuilder<CmsCubit,CmsState>(
          builder: (context,state){
            return IndexedStack(
              index: state.indexStack,
              children: [
                WebView(
                  initialUrl: args["url"] ?? '',
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: context.read<CmsCubit>().handleLoad(),
                  onWebViewCreated: (WebViewController webViewController) {
                    state.webController.complete(webViewController);
                  },
                ),
                const Center(child: CircularProgressIndicator(),),
              ],
            );
          },
        ));
  }
}