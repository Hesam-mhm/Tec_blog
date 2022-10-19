import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/controller/article_controller.dart';

class ArticleListScreen extends StatelessWidget {
   ArticleListScreen({super.key});
  @override
  Widget build(BuildContext context) {
      ArticleController articleController = Get.put(ArticleController());

    return SafeArea(
        child: Scaffold(
      appBar: appBar("مقاله های جدید"),
      body: Obx(()=>
      
         SizedBox(
           child: ListView.builder(
            itemCount: articleController.articleList.length,
            itemBuilder: (context, index) {
              
              return Text(articleController.articleList[index].title!);
            },
        ),
         ),
      ),
    ));
  }


}
