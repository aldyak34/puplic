import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Pinjam buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Center(
      child: Form(
      key: controller.formkey,
      child: Column(
        children: [
        TextFormField(
        controller: controller.tanggalpinjamController,
        decoration: InputDecoration(hintText: "Masukan tanggal pinjam"),
        validator: (value) {
          if (value!.length < 2) {
            return "tanggal tidak boleh kosong";
          }
          return null;
        },
      ),
      TextFormField(
        controller: controller.tanggalkembaliController,
        decoration: InputDecoration(hintText: "Masukan tanggal kembali"),
        validator: (value) {
          if (value!.length < 2) {
            return "tanggl tidak boleh kosong";
          }
          return null;
        },
      ),
        Obx(() => controller.loading.value
            ? CircularProgressIndicator()
            : ElevatedButton(
            onPressed: () {
              controller.post();
            },
            child: Text("Pinjam")
        )
        ),
  ]
    ),
    ),
    ),
    );

  }
}
