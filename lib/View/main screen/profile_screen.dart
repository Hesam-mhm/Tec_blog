import 'package:flutter/material.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';
import 'package:tec_blog/gen/assets.gen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
            Image.asset(
              Assets.images.imageAvatar.path,
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.bluepen.path),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headline3,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.headline4,
            ),
            Text(
              "fatemeamiri@gmail.com",
              style: textTheme.headline4,
            ),
            const SizedBox(
              height: 40,
            ),
            TecDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.headline4,
                  ))),
            ),
            TecDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headline4,
                  ))),
            ),
            TecDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primeryColor,
              child: SizedBox(
                  height: 40,
                  child: Center(
                      child: Text(
                    MyStrings.logOut,
                    style: textTheme.headline4,
                  ))),
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ));
  }
}
