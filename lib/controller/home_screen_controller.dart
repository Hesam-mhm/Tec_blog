import 'package:get/get.dart';
import 'package:tec_blog/component/api_constant.dart';
import 'package:tec_blog/models/article_model.dart';
import 'package:tec_blog/models/data_models.dart';
import 'package:tec_blog/models/poster_model.dart';
import 'package:tec_blog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel>? poster;
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodCastModel> topPodcastsList = RxList();

@override
onInit() {
super.onInit();
getHomeItems();


}
  

  getHomeItems() async {
    var response = await DioService().getmethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
     
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
