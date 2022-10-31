import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tec_blog/View/article/manage_article.dart';
import 'package:tec_blog/View/main%20screen/main_screen.dart';
import 'package:tec_blog/View/article/single.dart';
import 'package:tec_blog/View/splash_screen.dart';
import 'package:tec_blog/binding.dart';
import 'package:tec_blog/constant/my_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog/my_http_override.dart';
import 'View/article/single_manage_article.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        getPages: [
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => MainScreen(),
              binding: RegisterBinding()),
           GetPage(
              name: NamedRoute.routeSingleManageArticle,
              page: () => SingleManageArticle(),
              binding: ManageArticleBinding()),
          GetPage(
              name: NamedRoute.routeManageArticle,
              page: () => ManageArticle(),
              binding: ManageArticleBinding()),
          GetPage(
              name: NamedRoute.routeSingleArticle,
              page: () => Single(),
              binding: ArticleBinding()),
        ],
        theme: lightTheme(),
        home:  SplashScreen());
  }

  ThemeData lightTheme() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextStyle(
                    fontFamily: "dana", fontSize: 20, color: Colors.white);
              }

              return const TextStyle(
                  fontFamily: "dana", fontSize: 15, color: Colors.white);
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }

              return SolidColors.primeryColor;
            }),
          ),
        ),
        brightness: Brightness.light,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          subtitle1: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyText1: TextStyle(
              fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.seeMore,
              fontWeight: FontWeight.w700),
          headline4: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: Color.fromARGB(255, 70, 70, 70),
              fontWeight: FontWeight.w700),
          bodyText2: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.primeryColor,
              fontWeight: FontWeight.w700),
          headline5: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              color: SolidColors.hintText,
              fontWeight: FontWeight.w700),
          headline6: TextStyle(
              fontFamily: 'dana',
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w700),
          //  onpressed elevated button
          subtitle2: TextStyle(
              fontFamily: 'dana',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ));
  }
}

class NamedRoute {
  static String routeMainScreen = "/MainScreen";
  static String routeSingleArticle = "/SingleArticle";
  static String routeManageArticle = "/ManageArticle";
  static String routeSingleManageArticle = "/SingleManageArticle";
}
