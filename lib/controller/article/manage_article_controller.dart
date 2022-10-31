import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/component/storage_const.dart';
import 'package:tec_blog/models/article_info_model.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/tags_model.dart';
import 'package:tec_blog/services/dio_service.dart';

import '../../component/api_constant.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagsList = RxList();
 RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    loading.value = true ;
    var response =
        await DioService().getMethod("${ApiConstant.publishedByMe}1");
    // var response = await DioService().getMethod(ApiConstant.publishedByMe+GetStorage().read(StorageKey().userId));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
    }
    loading.value=false ;
   
  }
}
