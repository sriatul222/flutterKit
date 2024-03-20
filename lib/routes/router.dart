import 'package:fluro/fluro.dart';
import 'routes_handlers.dart';
import 'routes_name.dart';

class FluroRouters {
  static final router = FluroRouter();

  static void setupRouter(FluroRouter router) {
    router.define(
      RoutesName.login,
      handler: RouteHandlers.loginPageHandler,
    );
    router.define(
      RoutesName.forgotPassword,
      handler: RouteHandlers.forgetPageHandler,
    );
    router.define(
      RoutesName.newPassword,
      handler: RouteHandlers.newPasswordPageHandler,
    );
    router.define(
      RoutesName.register,
      handler: RouteHandlers.registerPageHandler,
    );
    router.define(
      RoutesName.otp,
      handler: RouteHandlers.otpHandler,
    );
    router.define(
      RoutesName.cmsScreen,
      handler: RouteHandlers.cmsHandler,
    );
    router.define(
      RoutesName.dashBoardScreen,
      handler: RouteHandlers.dashBoardHandler,
    );
    router.define(
      RoutesName.editProfileScreen,
      handler: RouteHandlers.editProfileHandler,
    );
    router.define(
      RoutesName.changePasswordScreen,
      handler: RouteHandlers.changePasswordHandler,
    );
  }
}
