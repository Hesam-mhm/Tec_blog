import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog/View/single.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/controller/list_article_controller.dart';
import 'package:tec_blog/controller/single_article_controller.dart';

class ArticleListScreen extends StatelessWidget {

 String title ;
 ArticleListScreen({required this.title});

  ListArticleController listrticleController = Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(title),
      body: Obx(
        () => SizedBox(
          child: ListView.builder(
            itemCount: listrticleController.articleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()  {
                  singleArticleController.id.value = int.parse(
                      listrticleController.articleList[index].id.toString());
                  singleArticleController.getArticleInfo();
                  Get.to(() => Single());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height / 6,
                        width: Get.width / 3,
                        child: CachedNetworkImage(
                          imageUrl:
                              listrticleController.articleList[index].image!,
                          imageBuilder: (((context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            );
                          })),
                          placeholder: ((context, url) {
                            return const SpinKitLoading();
                          }),
                          errorWidget: ((context, url, error) {
                            return const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey);
                          }),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            child: Text(
                              listrticleController.articleList[index].title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                listrticleController.articleList[index].author!,
                                style: textTheme.caption,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${listrticleController.articleList[index].view!} بازدید ",
                                style: textTheme.caption,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
