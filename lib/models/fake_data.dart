import 'package:get/get.dart';
import 'package:tec_blog/controller/home_screen_controller.dart';

HomeScreenController homeScreenController = Get.put(HomeScreenController());

List tagList = homeScreenController.tagsList;
List selectedTags = [];
