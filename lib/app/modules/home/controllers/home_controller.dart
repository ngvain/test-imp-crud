import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:test_imp_crud/app/data/api_endpoints.dart';
import 'package:test_imp_crud/app/data/models/faq.dart';
import 'package:test_imp_crud/app/data/models/request/faq_request.dart';
import 'package:test_imp_crud/app/data/models/response/faq_response.dart';

class HomeController extends GetxController with StateMixin<FaqResponse> {
  TextEditingController pertanyaanCtl = TextEditingController();
  TextEditingController jawabanCtl = TextEditingController();
  Dio dio;
  HomeController(this.dio);
  int page = 1;
  int row = 20;
  final box = GetStorage();

  @override
  void onInit() async {
    change(null, status: RxStatus.empty());
    await getInitialData();
    super.onInit();
  }

  Future<void> getInitialData() async {
    try {
      final response = await dio.get(
        ApiEndpoints.faq,
        queryParameters: FaqRequest(page: page, rows: row).toJson(),
      );
      if (response.statusCode == 200) {
        FaqResponse result = FaqResponse.fromJson(response.data);
        log(result.data.length.toString());
        change(result, status: RxStatus.success());
      }
    } on DioError catch (e) {
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']),
        ),
      );
    }
  }

  Future<void> postFaq() async {
    change(state, status: RxStatus.loading());
    try {
      await dio.post(
        ApiEndpoints.faq,
        data: Faq(
          pertanyaan: pertanyaanCtl.text,
          jawaban: jawabanCtl.text,
        ).toJson(),
      );
      Get.back();
      await getInitialData();
    } on DioError catch (e) {
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']),
        ),
      );
    }
    clearForm();
  }

  Future<void> putFaq(int id) async {
    change(state, status: RxStatus.loading());
    try {
      await dio.post(
        "${ApiEndpoints.faq}/$id",
        data: Faq(
          pertanyaan: pertanyaanCtl.text,
          jawaban: jawabanCtl.text,
        ).toJson(),
      );
      Get.back();
      await getInitialData();
    } on DioError catch (e) {
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']),
        ),
      );
    }
    clearForm();
  }

  Future<void> getFaqById(int id) async {
    clearForm();
    try {
      final response = await dio.get(
        '${ApiEndpoints.faq}/$id',
      );
      Faq faq = Faq.fromJson(response.data['data']);
      log(faq.toJson().toString());
      pertanyaanCtl.text = faq.pertanyaan ?? '';
      jawabanCtl.text = faq.jawaban ?? '';
    } on DioError catch (e) {
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']),
        ),
      );
    }
  }

  Future<void> deleteFaq(int id) async {
    clearForm();
    try {
      await dio.delete(
        '${ApiEndpoints.faq}/$id',
      );
      Get.back();
      getInitialData();
    } on DioError catch (e) {
      change(
        null,
        status: RxStatus.error(
          jsonEncode(e.response?.data['message']),
        ),
      );
    }
  }

  void clearForm() {
    pertanyaanCtl.clear();
    jawabanCtl.clear();
  }
}
