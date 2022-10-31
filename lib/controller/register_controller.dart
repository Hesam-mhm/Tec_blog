import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/View/Register/register_intro.dart';
import 'package:tec_blog/View/main%20screen/main_screen.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/component/storage_const.dart';
import 'package:tec_blog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };
    var response = await DioService().postMethod(map, ApiConstant.postRsgister);
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };
    var response = await DioService().postMethod(map, ApiConstant.postRsgister);
    var states = response.data['response'];
    switch (states) {
      case 'verifierd':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);
        Get.to(MainScreen());
        break;

      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی اشتباه می باشد .');
        break;

      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است .');
        break;
    }
  }

  toggleLogIn() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      debugPrint('post screen');
    }
  }
}
