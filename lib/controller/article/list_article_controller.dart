import 'package:get/get.dart';
import 'package:tec_blog/constant/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  getArticleList() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    }
    loading.value = false;
  }

  getArticlesWithTagId(String id) async {
    articleList.clear();
    loading.value = true;
    // ignore: prefer_interpolation_to_compose_strings
    var response = await DioService().getMethod(ApiConstant.baseUrl +
        "article/get.php?command=get_articles_with_cat_id&cat_id=$id&user_id=1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    }
    loading.value = false;
  }
}
