import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileRechargeController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;

  // Updated image paths
  final carouselImages = [
    'assets/images/airtel_offer.png',
    'assets/images/jio_offer.jpg',
  ];

  late Timer autoScrollTimer;

  get recents => null;

  

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        final nextPage = (currentIndex.value + 1) % carouselImages.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        currentIndex.value = nextPage;
      }
    });
  }

  void updateIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    autoScrollTimer.cancel(); // Stop the timer when the controller is disposed
    pageController.dispose();
    super.onClose();
  }
}
