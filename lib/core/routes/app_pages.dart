import 'package:get/get.dart';
import 'package:hungry_flutter_app/features/auth/views/login_view.dart';
import 'package:hungry_flutter_app/root.dart';
import 'package:hungry_flutter_app/splash.dart';
import '../../features/auth/views/signup_view.dart';
import '../../features/product/views/product_details_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(name: AppRoutes.login, page: () => const LoginView()),
    GetPage(name: AppRoutes.register, page: () => const SignupView()),
    GetPage(
      name: AppRoutes.root,
      page: () => const Root(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.productDetails,
      page: () => const ProductDetailsView(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
