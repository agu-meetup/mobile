import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class DetailModelView extends ChangeNotifier {
  /// Carousel Slider
  List<String> imagePaths = [
    'assets/test_image/test_detail_1.png',
    'assets/test_image/test_detail_2.png',
    'assets/test_image/test_detail_3.png',
  ];
  int imageIndex = 0;
  void updateImageIndex(int newImageIndex) {
    imageIndex = newImageIndex;
    notifyListeners();
  }

  /// Hosted people and price
  String mainHostImage = "assets/test_image/test_profile_pic.png";
  List<String> hostsMembers = ['Kerem Keskin', "Hamza Duman"];
  String price = 'free';
}
