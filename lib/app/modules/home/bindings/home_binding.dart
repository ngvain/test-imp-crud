import 'package:get/get.dart';
import 'package:test_imp_crud/app/data/api_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(ApiProvider().dio),
    );
  }
}
