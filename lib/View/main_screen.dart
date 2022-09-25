import 'package:flutter/material.dart';
import 'package:tec_blog/View/home_Screen.dart';
import 'package:tec_blog/View/profile_screen.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/my_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 10;

    List<Widget> techMainscreenPages = [
      HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
      ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
    ];

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: SolidColors.scafoldBg,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu),
                  Image(
                    image: AssetImage(Assets.images.logo.path),
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.search)
                ],
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: techMainscreenPages[selectedPageIndex],
                ),
              ),
              BottomNavigation(
                size: size,
                bodyMargin: bodyMargin,
                changeScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                },
              )
            ],
          )),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
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
                borderRadius: BorderRadius.all(Radius.circular(18)),
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
                    onPressed: () => "",
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
