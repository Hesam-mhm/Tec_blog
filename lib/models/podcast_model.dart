import 'package:tec_blog/component/api_constant.dart';

class PodCastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodCastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  PodCastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.hostDlUrl + element["poster"];
    publisher = element["publisher"];
    view = element["view"];
    createdAt = element["created_at"];
  }
}
