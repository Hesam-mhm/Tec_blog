import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class ArticleController extends GetxController{
RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;


  @override
  onInit() {
    super.onInit();
    getList();
  }




  getList() async {
    loading.value = true;
    var response = await DioService().getmethod(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

    }
    loading.value = false;
  }





}