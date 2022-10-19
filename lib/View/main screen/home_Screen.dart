// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_strings.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/fake_data.dart';

import '../../component/my_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => 
        homeScreenController.loading.value== false ?
        
        Column(
          children: [
            poster(),
            const SizedBox(
              height: 16,
            ),
            tags(),
            const SizedBox(
              height: 32,
            ),
            seeMoreBlog(),
            topVisited(),
            seeMorePodCast(),
            topPodCasts(),
            const SizedBox(
              height: 60,
            )
          ],
        ): Column(
          
          children:[SizedBox(height: 300,) , const SpinKitLoading()] )
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx((() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 8),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: size.height / 5.53,
                          width: size.width / 2.66,
                          child: Stack(
                            children: [CachedNetworkImage(
                          imageUrl: homeScreenController
                              .topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
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
                          errorWidget: (context, url, error) => const Icon(
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
                                        homeScreenController
                                            .topVisitedList[index].author!,
                                        style: textTheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
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
                        homeScreenController.topVisitedList[index].title!,
                        style: textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            },
          ))),
    );
  }

  Widget topPodCasts() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcastsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 8),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 5.53,
                        width: size.width / 2.66,
                        child: CachedNetworkImage(
                          imageUrl: homeScreenController
                              .topPodcastsList[index].poster!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(image: imageProvider)),
                          ),
                          placeholder: (context, url) =>
                              const SpinKitLoading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      )),
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      homeScreenController.topPodcastsList[index].title!,
                      style: textTheme.headline4,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget seeMorePodCast() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 16),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.images.bluemic.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }

  Widget seeMoreBlog() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 16),
      child: Row(
        children: [
          ImageIcon(AssetImage(Assets.icons.bluepen.path)),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.headline3,
          )
        ],
      ),
    );
  }

  Widget tags() {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          }),
        ));
  }

  Widget poster() {
    return 

       Stack(
        
        children: [
          Container(
            height: size.height / 4.2,
            width: size.width / 1.25,
            foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                    colors: GradiantColors.homePosterCoverGradiant,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
             child:  CachedNetworkImage(
                          imageUrl: homeScreenController
                              .poster.value.image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration:BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image:imageProvider,
                    fit: BoxFit.cover)),
                          ),
                          placeholder: (context, url) =>
                              const SpinKitLoading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                          ),
                        ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                child: Text(
                 homeScreenController.poster.value.title!,
                  style: textTheme.headline1,
                ),
              ),
            ),
          )
        ],
      )
    ;
  }
}

