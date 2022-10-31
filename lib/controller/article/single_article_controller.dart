import 'package:get/get.dart';
import 'package:tec_blog/constant/api_constant.dart';
import 'package:tec_blog/models/article_info_model.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class SingleArticleController extends GetxController {
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
          "").obs;
  RxList<TagsModel> relatedTags = RxList();
  RxList<ArticleModel> relatedarticle = RxList();
  RxInt id = RxInt(0);
  RxBool loading = false.obs;

  getArticleInfo() async {
    articleInfoModel = ArticleInfoModel(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
          "").obs;

    loading.value = true;

    loading.value = true;
    var response = await DioService().getMethod(
        '${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=1');
    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      relatedTags.clear();
      response.data['tags'].forEach((element) {
        relatedTags.add(TagsModel.fromJson(element));
      });

      relatedarticle.clear();
      response.data['related'].forEach((element) {
        relatedarticle.add(ArticleModel.fromJson(element));
      });
    }
    loading.value = false;
  }
}
