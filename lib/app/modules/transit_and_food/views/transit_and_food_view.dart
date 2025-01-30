import 'package:demo_project/app/modules/transit_and_food/controllers/transit_and_food_controller.dart';
import 'package:demo_project/app/modules/travel/controllers/travel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransitAndFoodView extends GetView<TransitAndFoodController> {
  const TransitAndFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text('Trasit & Food',
          style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF007f97),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.white,
            onPressed: () {
              // Get.to(() => TravelHelpView());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel slider
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.carouselImages.length,
                  onPageChanged: (index) {
                    controller.currentIndex.value = index; // Update observable
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Image.asset(
                        controller.carouselImages[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 5),

              // Carousel indicators
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.carouselImages.length,
                        (index) {
                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndex.value == index
                              ? const Color(0xFF007f97)
                              : Colors.grey,
                        ),
                      );
                    },
                  ),
                );
              }),

              const SizedBox(height: 20),
              // Space between carousel and the next section

              // Three containers in a column
              Column(
                children: [
                  _buildActivityContainer(
                    title: 'FASTag',
                    options: [
                      {'label': 'Recharge FASTag', 'icon': Icons.refresh},
                      {'label': 'Buy FASTag', 'icon': Icons.shopping_cart}
                    ],
                  ),
                  const SizedBox(height: 20), // Space between containers
                  _buildActivityContainer(
                    title: 'Transit',
                    options: [
                      {'label': 'Metros', 'icon': Icons.directions_subway},
                      {'label': 'NCMC Recharge', 'icon': Icons.credit_card}
                    ],
                  ),
                  const SizedBox(height: 20), // Space between containers
                  _buildActivityContainer(
                    title: 'Cabs',
                    options: [
                      {'label': 'Prepaid Cabs', 'icon': Icons.local_taxi},
                      {'label': 'Roadside Assistance', 'icon': Icons.car_repair}
                    ],
                  ),
                  const SizedBox(height: 20), // Space between containers
                  _buildImageActivityContainer( // New container with image options
                    title: 'Food',
                    options: [
                      {'label': 'Swiggy', 'image': 'assets/images/swiggy.png'},
                      {'label': 'Zomato', 'image': 'assets/images/zomato.png'}
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityContainer({
    required String title,
    required List<Map<String, dynamic>> options,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white38.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          // List of options with icons
          Column(
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(option['icon'], color: Color(0xFF007f97)),
                    // Icon to the left
                    const SizedBox(width: 8.0),
                    // Space between icon and text
                    Text(
                      option['label'],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildImageActivityContainer({
    required String title,
    required List<Map<String, dynamic>> options,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white38.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          // List of options with images
          Column(
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      option['image'], // Image to the left
                      width: 24.0,
                      height: 24.0,
                    ),
                    const SizedBox(width: 8.0), // Space between image and text
                    Text(
                      option['label'],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}