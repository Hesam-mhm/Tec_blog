import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_strings.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.tecbot.path,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom, style: textTheme.headline4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: size.height / 2,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                MyStrings.insertYourEmail,
                                style: textTheme.headline4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: "tecblog@gmail.com",
                                      hintStyle: textTheme.headline5),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("ادامه "))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text("بزن بریم"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
