import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan/app/data/_profider/dart/provider.dart';
import 'package:peminjam_perpustakaan/app/data/enpoint/enpoint.dart';
import 'package:peminjam_perpustakaan/app/data/storage/storage.dart';

class AddPeminjamanController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController tanggalpinjamController = TextEditingController();
  final TextEditingController tanggalkembaliController = TextEditingController();


  final count = 0.obs;
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

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formkey.currentState?.save();
      if (formkey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam, data: {
          "user_id": StorageProvider.read(StorageKey.idUser),
          "book_id": Get.parameters['id'],
          "tanggal_pinjam ": tanggalpinjamController.text.toString(),
          "tanggal_kembali": tanggalkembaliController.text.toString(),
        });

        } else {
          Get.snackbar("Sorry", "ADD Peminjaman gagal", backgroundColor: Colors.orange);
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

