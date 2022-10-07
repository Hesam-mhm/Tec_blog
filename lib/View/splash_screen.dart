
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/View/main_screen.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/component/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

 @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.logo.path,
            height: 64,
          ),
          const SizedBox(
            height: 32,
          ),
          const SpinKitFadingCube(
            color: SolidColors.primeryColor,
            size: 32.0,
          )
        ],
      )),
    ));
  }
}
