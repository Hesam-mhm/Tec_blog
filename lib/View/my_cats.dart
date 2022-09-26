import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/my_strings.dart';

class MyCats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
        var size = MediaQuery.of(context).size;

    var bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(
                Assets.images.tecbot.path,
                height: 100,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(MyStrings.successfulRegistration, style: textTheme.bodyText2),
              Padding(
                padding:  EdgeInsets.only(right:bodyMargin,left: bodyMargin ),
                child: TextField(
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline4,
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Text(MyStrings.chooseCats,style:textTheme.bodyText2,)
            ],
          ),
        ),
      ),
    ));
  }
}
