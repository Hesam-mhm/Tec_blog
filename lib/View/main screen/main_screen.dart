import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec_blog/View/main%20screen/home_Screen.dart';
import 'package:tec_blog/View/main%20screen/profile_screen.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/constant/my_strings.dart';
import 'package:tec_blog/controller/register_controller.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/constant/my_colors.dart';

import '../../component/dimens.dart';

GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
   

    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
            backgroundColor: SolidColors.scafoldBg,
            child: Padding(
              padding: EdgeInsets.only(right: Dimens.bodyMargin, left: Dimens.bodyMargin),
              child: ListView(
                children: [
                  DrawerHeader(
                      child: Center(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    ),
                  )),
                  ListTile(
                    title: Text(
                      "پروفایل کاربری",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: SolidColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "درباره تک‌بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () {},
                  ),
                  const Divider(
                    color: SolidColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "اشتراک گذاری تک بلاگ",
                      style: textTheme.headline4,
                    ),
                    onTap: () async {
                      await Share.share(MyStrings.shareText);
                    },
                  ),
                  const Divider(
                    color: SolidColors.dividerColor,
                  ),
                  ListTile(
                    title: Text(
                      "تک‌بلاگ در گیت هاب",
                      style: textTheme.headline4,
                    ),
                    onTap: () {
                      myUrlLauncher(MyStrings.techBlogGithubUrl);
                    },
                  ),
                  const Divider(
                    color: SolidColors.dividerColor,
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: SolidColors.scafoldBg,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: (() {
                      _key.currentState!.openDrawer();
                    }),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                    )),
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: size.height / 13.6,
                ),
                const Icon(Icons.search)
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Obx(() {
                  return IndexedStack(
                    index: selectedPageIndex.value,
                    children: [
                      HomeScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: Dimens.bodyMargin),
                      ProfileScreen(
                          size: size,
                          textTheme: textTheme,
                          bodyMargin: Dimens.bodyMargin)
                    ],
                  );
                }),
              ),
              BottomNavigation(
                size: size,
                bodyMargin: Dimens.bodyMargin,
                changeScreen: (int value) {
                  selectedPageIndex.value = value;
                },
              )
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class BottomNavigation extends StatelessWidget {
  BottomNavigation(
      {Key? key,
      required this.size,
      required this.bodyMargin,
      required this.changeScreen})
      : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomNavBackgroand,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55)),
                gradient: LinearGradient(colors: GradiantColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Get.find<RegisterController>().toggleLogIn();
                    },
                    icon: ImageIcon(
                      AssetImage(Assets.icons.writre.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
