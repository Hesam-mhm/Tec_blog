import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec_blog/View/article/article_list_screen.dart';

import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';
import 'package:tec_blog/controller/article/list_article_controller.dart';
import 'package:tec_blog/controller/article/manage_article_controller.dart';
import 'package:tec_blog/controller/article/single_article_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({super.key});


  var manageArticleController = Get.find<ManageArticleController>();
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
          child:  Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: manageArticleController
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
                        manageArticleController.articleInfoModel.value.title!,
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
                            manageArticleController
                                .articleInfoModel.value.author!,
                            style: textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            manageArticleController
                                .articleInfoModel.value.createdAt!,
                            style: textTheme.caption,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: HtmlWidget(
                        manageArticleController.articleInfoModel.value.content!,
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
          itemCount: manageArticleController.tagsList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
             
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
                            manageArticleController.tagsList[index].title!,
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

}
