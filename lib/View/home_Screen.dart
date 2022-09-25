// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../models/fake_data.dart';
import '../my_colors.dart';
import '../my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
     child: Column(
       children: [
        
         HomePagePoster(size: size, textTheme: textTheme),
         
         const SizedBox(
           height: 16,
         ),
         
         HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
         
         const SizedBox(
           height: 32,
         ),
          
         SeeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),
          
         HomePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
        
        SeeMorePodCast(bodyMargin: bodyMargin, textTheme: textTheme),

         HomePagePodCastList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
         const SizedBox(height: 60,)
       ],
     ),
            );
  }
}

class HomePagePodCastList extends StatelessWidget {
  const HomePagePodCastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: podCastList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 8),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.53,
                      width: size.width / 2.66,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(16)),
                            image: DecorationImage(
                                image: AssetImage(
                                    podCastList[index].imageAsset),
                                fit: BoxFit.cover)),
                      ),
                    )),
                SizedBox(
                  width: size.width / 2.4,
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        podCastList[index].title,
                        style: textTheme.headline4,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class SeeMorePodCast extends StatelessWidget {
  const SeeMorePodCast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(right: index == 0 ? bodyMargin : 8),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height / 5.53,
                      width: size.width / 2.66,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(
                                        Radius.circular(16)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        blogList[index].imageUrl),
                                    fit: BoxFit.cover)),
                            foregroundDecoration:
                                const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.blogPost,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  2, 0, 2, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    blogList[index].writer,
                                    style: textTheme.subtitle1,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    blogList[index].views,
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
                    blogList[index].title,
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
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 8, index == 0 ? bodyMargin : 15, 8),
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(24)),
                    gradient: LinearGradient(
                      colors: GradiantColors.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(Assets.icons.hashtag.path),
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        tagList[index].title,
                        style: textTheme.headline2,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.25,
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                  image:
                      AssetImage(homePagePosterMap["imageAsset"]),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                  colors: GradiantColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 8,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homePagePosterMap["veiw"],
                        style: textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 14,
                      )
                    ],
                  )
                ],
              ),
              Text(
                homePagePosterMap["title"],
                style: textTheme.headline1,
              )
            ],
          ),
        )
      ],
    );
  }
}
