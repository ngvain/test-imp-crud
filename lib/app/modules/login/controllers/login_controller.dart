import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_imp_crud/app/data/api_endpoints.dart';
import 'package:test_imp_crud/app/data/models/request/login_request.dart';
import 'package:test_imp_crud/app/data/models/response/login_response.dart';
import 'package:test_imp_crud/app/routes/app_pages.dart';

class LoginController extends GetxController with StateMixin {
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    usernameCtl.text = 'applicantimp@gmail.com';
    passwordCtl.text = '00000000';
    super.onInit();
  }

  Dio dio;
  LoginController(this.dio);
  TextEditingController usernameCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();
  final box = GetStorage();

  login() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: LoginRequest(
          nip: usernameCtl.text,
          password: passwordCtl.text,
        ).toJson(),
      );
      if (response.statusCode == 200) {
        var result = LoginResponse.fromJson(response.data['data']);
        log(result.accessToken.toString());
        box.write('isLogin', true);
        box.write('name', result.name);
        box.write('accessToken', result.accessToken);
        Get.offAllNamed(Routes.HOME);
      }
    } on DioError catch (e) {
      log(e.toString());
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']['error']),
        ),
      );
    }
  }
}
