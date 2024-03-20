import 'package:club/Routes/router.dart';
import 'package:club/appTheme/app_Theme.dart';
import 'package:club/appTheme/theme_Cubit.dart';
import 'package:club/appTheme/theme_Prefrences.dart';
import 'package:club/appTheme/theme_State.dart';
import 'package:club/extra/shared_preferences.dart';
import 'package:club/noNetwork/cubit/network_bloc.dart';
import 'package:club/noNetwork/cubit/network_event.dart';
import 'package:club/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));
  await AppPreferences.shared.initialisePrefs();
  FluroRouters.setupRouter(FluroRouters.router);
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  
  runApp(
    BlocProvider<NetworkBloc>(
      create: (_) => NetworkBloc()..add(ListenConnection()),
      child: MyApp(themeRepository: themeRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ThemeRepository themeRepository;

  const MyApp({super.key, required this.themeRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: themeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(
              themeRepository: context.read<ThemeRepository>(),
            )
              ..getCurrentTheme()
          ),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) =>
        previous.themeMode != current.themeMode,
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              color: Colors.white,
              title: 'Flutter Kit',
              theme: AppTheme.lightTheme,
              // If ThemeMode is ThemeMode.light, this is selected as app's theme
              darkTheme: AppTheme.darkTheme,
              themeMode: state.themeMode,
              onGenerateRoute: FluroRouters.router.generator,
              initialRoute: RoutesName.login,
            ),
          );
        });
  }
}
