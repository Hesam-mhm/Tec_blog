import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec_blog/View/article/article_list_screen.dart';

import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';
import 'package:tec_blog/controller/article/list_article_controller.dart';
import 'package:tec_blog/controller/article/single_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  Single({super.key});
  ListArticleController listArticleController =
      Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: singleArticleController.articleInfoModel.value.title == null
              ? SizedBox(height: Get.height, child: const SpinKitLoading())
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleController
                              .articleInfoModel.value.image!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const SpinKitLoading(),
                          errorWidget: (context, url, error) =>
                              Image.asset(Assets.images.singlePlaceHolder.path),
                        ),
                        Container(
                          height: 60,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: GradiantColors.singleAppbarGradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: Row(
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        singleArticleController.articleInfoModel.value.title!,
                        maxLines: 2,
                        style: textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin),
                      child: Row(
                        children: [
                          SizedBox(
                              height: 40,
                              child: Image(
                                  image: AssetImage(
                                Assets.images.imageAvatar.path,
                              ))),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.author!,
                            style: textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.createdAt!,
                            style: textTheme.caption,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: HtmlWidget(
                        singleArticleController.articleInfoModel.value.content!,
                        textStyle: textTheme.headline4,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            const SpinKitLoading(),
                      ),
                    ),
                    tags(textTheme, size, bodyMargin),
                    const SizedBox(
                      height: 48,
                    ),
                    relatedArticle(textTheme, size, bodyMargin),
                    const SizedBox(
                      height: 16,
                    ),
                    relatedArticleList(textTheme, size, bodyMargin)
                  ],
                ),
        ),
      ),
    ));
  }

  Widget tags(textTheme, size, bodyMargin) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singleArticleController.relatedTags.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagName = singleArticleController.relatedTags[index].title!;
                var tagId = singleArticleController.relatedTags[index].id!;
                await listArticleController.getArticlesWithTagId(tagId);
                Get.to(ArticleListScreen(
                  title: tagName,
                ));
              },
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 8, index == 0 ? bodyMargin : 15, 8),
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: SolidColors.submitArticle),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            singleArticleController.relatedTags[index].title!,
                            style: textTheme.headline4,
                          )
                        ],
                      ),
                    ),
                  )),
            );
          }),
        ));
  }

  Widget relatedArticle(textTheme, size, bodyMargin) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.relatedArticle,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }

  Widget relatedArticleList(textTheme, size, bodyMargin) {
    return SizedBox(
        height: size.height / 3.5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singleArticleController.relatedarticle.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleController.id.value = int.parse(
                    singleArticleController.relatedarticle[index].id
                        .toString());
                singleArticleController.getArticleInfo();
                Get.to(Single());
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 8),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.53,
                          width: size.width / 2.66,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: singleArticleController
                                    .relatedarticle[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                  foregroundDecoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    gradient: LinearGradient(
                                        colors: GradiantColors.blogPost,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const SpinKitFadingCube(
                                  color: SolidColors.primeryColor,
                                  size: 32,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        singleArticleController
                                            .relatedarticle[index].author!,
                                        style: textTheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        singleArticleController
                                            .relatedarticle[index].view!,
                                        style: textTheme.subtitle1,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.white,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        singleArticleController.relatedarticle[index].title!,
                        style: textTheme.headline5,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
