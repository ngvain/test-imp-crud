import 'package:get/get.dart';
import 'package:test_imp_crud/app/data/api_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(ApiProvider().dio),
    );
  }
}
