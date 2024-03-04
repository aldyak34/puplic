import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan/app/data/_profider/dart/provider.dart';
import 'package:peminjam_perpustakaan/app/data/enpoint/enpoint.dart';
import 'package:peminjam_perpustakaan/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController telfonController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final count = 0.obs;
  //TODO: Implement RegisterController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  register() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response =
            await ApiProvider.instance().post(Endpoint.register, data: {
          "nama": namaController.text.toString(),
          "username": usernameController.text.toString(),
          "alamat": alamatController.text.toString(),
          "telp": int.parse(
            telfonController.text.toString(),
          ),
          "password": passwordController.text.toString(),
        });

        if (response.statusCode == 201) {
          Get.snackbar("Heloo", "HOOla");
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar("Sorry", "login gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          Get.snackbar("sorry", "${e.response?.data['messsage']}",
              backgroundColor: Colors.orange);
        } else {
          Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      }
    } catch (e) {
      loading(false);
      Get.snackbar("erorr", e.toString(), backgroundColor: Colors.red);
    }
  }
}
