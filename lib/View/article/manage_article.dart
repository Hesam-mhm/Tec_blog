import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/controller/article/manage_article_controller.dart';
import 'package:tec_blog/controller/article/single_article_controller.dart';
import 'package:tec_blog/main.dart';
import 'package:validators/validators.dart';
import '../../constant/my_strings.dart';
import '../../controller/register_controller.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({Key? key}) : super(key: key);

  var manageArticleController = Get.find<ManageArticleController>();
  var singleArticleController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: appBar("مدیریت مقاله ها"),
            body: Obx(() => manageArticleController.loading.value
                ? const SpinKitLoading()
                : manageArticleController.articleList.isNotEmpty
                    ? SizedBox(
                        child: ListView.builder(
                          itemCount: manageArticleController.articleList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                singleArticleController.id.value = int.parse(
                                    manageArticleController
                                        .articleList[index].id
                                        .toString());
                                singleArticleController.getArticleInfo();
                                Get.toNamed(NamedRoute.routeSingleArticle);
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
                                        imageUrl: manageArticleController
                                            .articleList[index].image!,
                                        imageBuilder:
                                            (((context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(16)),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover)),
                                          );
                                        })),
                                        placeholder: ((context, url) {
                                          return const SpinKitLoading();
                                        }),
                                        errorWidget: ((context, url, error) {
                                          return const Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              size: 50,
                                              color: Colors.grey);
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 2,
                                          child: Text(
                                            manageArticleController
                                                .articleList[index].title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              manageArticleController
                                                  .articleList[index].author!,
                                              style: textTheme.caption,
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "${manageArticleController.articleList[index].view!} بازدید ",
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
                      )
                    : articleEmptyState(textTheme)),
                    
                    bottomNavigationBar:   Padding(
            padding: const EdgeInsets.fromLTRB(30,0,30,0),
            child: ElevatedButton(
              onPressed: () {
              Get.toNamed(NamedRoute.routeSingleManageArticle);
              },
              child: const Text("بریم برای نوشتن یه مقاله ی  باحال"),
            ),
          )
                    
                    ));
            
  
  }

  Widget articleEmptyState(TextTheme textTheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.tecbotEmpty.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: MyStrings.emptyState,
                style: textTheme.headline4,
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}
