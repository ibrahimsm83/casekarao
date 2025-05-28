import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetToast {
   static show(String text, {dynamic responce, dynamic e}) {
    Get.snackbar(
      text,
      responce !=null ?responce.data['message'] : e ?? 'sonething went wrong',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:text == 'Success' ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }
}