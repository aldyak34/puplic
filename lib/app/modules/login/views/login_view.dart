import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "Masukan username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukan password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() {
                  return controller.loading.value ?
                  const CircularProgressIndicator() :
                  ElevatedButton(onPressed: () {
                    controller.login();
                  }, child: Text("login"));
                }),
                ElevatedButton(onPressed: () => Get.offAllNamed(Routes.REGISTER), child: Text("daftar"))
                ],
            ).paddingSymmetric(horizontal: 16)),
      ),
    );
  }
}