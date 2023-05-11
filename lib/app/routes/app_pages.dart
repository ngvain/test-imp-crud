// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

final box = GetStorage();

class AppPages {
  AppPages._();

  static String INITIAL =
      box.read<bool>('isLogin') ?? false ? Routes.HOME : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
