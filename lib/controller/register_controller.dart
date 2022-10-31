import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/View/Register/register_intro.dart';
import 'package:tec_blog/View/main%20screen/main_screen.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/component/storage_const.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/main.dart';
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
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey().token, response.data['token']);
        box.write(StorageKey().userId, response.data['user_id']);

        Get.offAll(MainScreen());
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
    if (GetStorage().read(StorageKey().token) == null) {
      Get.to(RegisterIntro());
    } else {
      writeArticleAndMakePodCastBottomSheet();
    }
  }

  writeArticleAndMakePodCastBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
             
              children: [
                SvgPicture.asset(Assets.images.tecbot.path, height: 40),
                const SizedBox(
                  width: 16,
                ),
                const Text("دونسته هات رو با بقیه به اشتراک بذار ...")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
                """فکر کن !! اینجا بودنت به این معناست که یک گیک تکنولوژی هستی  دوسته هات رو با جامعه ی گیک های فارسی زبان به اشتراک بذار ..."""),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(NamedRoute.routeManageArticle);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.icons.writeArticleIcon.path,
                          scale: 5,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text("مدیریت مقاله ها"),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.makePodcastIcon.path,
                        scale: 5,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text("مدیریت پادکست ها")
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
