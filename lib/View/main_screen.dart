import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec_blog/View/home_Screen.dart';
import 'package:tec_blog/gen/assets.gen.dart';
import 'package:tec_blog/models/data_models.dart';
import 'package:tec_blog/models/fake_data.dart';
import 'package:tec_blog/my_colors.dart';
import 'package:tec_blog/my_strings.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    var bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
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
          body: Stack(children: [
            
             HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
             Positioned(
              bottom: 0,
              left:0 ,
              right: 0,
               child: Container(
                height: size.height/10,
                decoration: const BoxDecoration(
                           gradient: LinearGradient(colors: GradiantColors.bottomNavBackgroand,begin: Alignment.topCenter,end: Alignment.bottomCenter)
                
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: bodyMargin,right: bodyMargin),
                  child: Container( 
                    height: size.height/8,
                     decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),
                             gradient: LinearGradient(colors: GradiantColors.bottomNav)
                  
                  ),
                  child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => "",
                       icon: ImageIcon(AssetImage(Assets.icons.home.path),color: Colors.white,)),IconButton(
                        onPressed: () => "",
                       icon: ImageIcon(AssetImage(Assets.icons.writre.path),color: Colors.white,)),IconButton(
                        onPressed: () => "",
                       icon: ImageIcon(AssetImage(Assets.icons.user.path),color: Colors.white,)),
                    ],
                  ),

                     
                  ),
                ),
               ),
             )
            
            ],
            
             
          )),
    );
  }
}

