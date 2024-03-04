import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('LIBRARY', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text('PUBLIC, EDUCATION CENTER', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 32),
              TextFormField(
                controller: controller.namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 1) {
                    return "Alamat tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.telfonController,
                decoration: const InputDecoration(
                  labelText: 'Telfon',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Telfon tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Obx(() => controller.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () {
                  controller.register();
                },
                child: const Text("Register"),
              )),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
