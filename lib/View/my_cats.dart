import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/data_models.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/component/my_colors.dart';
import 'package:tec_blog/component/my_component.dart';
import 'package:tec_blog/component/my_strings.dart';

class MyCats extends StatefulWidget {
  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    var bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              Text(MyStrings.successfulRegistration,
                  style: textTheme.bodyText2),
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: TextField(
                  style: textTheme.headline4,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                    hintStyle: textTheme.headline4,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                MyStrings.chooseCats,
                style: textTheme.bodyText2,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: 85,
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: tagList.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.26),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTags.add(
                                  HashTagModel(title: tagList[index].title));
                              tagList.remove(tagList[index]);
                            });
                          },
                          child: MainTags(textTheme: textTheme, index: index));
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                Assets.images.flesh.path,
                scale: 3,
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                height: 85,
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: selectedTags.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 0.26),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              tagList.add(HashTagModel(
                                  title: selectedTags[index].title));
                              selectedTags.remove(selectedTags[index]);
                            });
                          },
                          child: SelectedMainTags(
                              textTheme: textTheme, index: index));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
