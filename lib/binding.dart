import 'package:get/get.dart';
import 'package:tec_blog/controller/article/list_article_controller.dart';
import 'package:tec_blog/controller/article/manage_article_controller.dart';
import 'package:tec_blog/controller/register_controller.dart';
import 'package:tec_blog/controller/article/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class ManageArticleBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ManageArticleController());
    Get.lazyPut((() => ManageArticleController()));
  }
}
