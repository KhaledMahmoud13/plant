import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:plant/controller/plant_controller.dart';

class HomeView extends GetView<PlantController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-1/261706988_4333611223433326_4670818836338521941_n.jpg?stp=dst-jpg_p200x200&_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=2umX7UQ9SmYQ7kNvgHCrhps&_nc_ht=scontent.fcai19-2.fna&oh=00_AYA2clPJ2wCs0fAdU80uiA3zkQy0CiNCqI06L9ZPrIJPgw&oe=66610107'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'KHALED',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.notifications_none,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.grey[400],
                size: 20,
              ),
              Text(
                'Dhaka, Bangladesh',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w100,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            height: 40,
            child: TextFormField(
              enabled: false,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                hintText: 'Search here',
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  Icons.format_list_bulleted_sharp,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: List.generate(
                  controller.categories.length,
                  (index) => InkWell(
                    onTap: () => controller.changeCategory(index),
                    child: Container(
                      margin: EdgeInsets.all(4),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: controller.selectedIndex.value == index
                              ? const Color.fromARGB(255, 68, 115, 70)
                              : Colors.grey,
                        ),
                        color: controller.selectedIndex.value == index
                            ? const Color.fromARGB(255, 68, 115, 70)
                            : Colors.white,
                      ),
                      child: Text(
                        controller.categories[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: controller.selectedIndex.value == index
                              ? Colors.white
                              : Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          StaggeredGrid.count(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: List.generate(
              controller.plantList.length,
              (index) => InkWell(
                onTap: () => Get.toNamed(
                  '/details',
                  arguments: controller.plantList[index],
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/${controller.plantList[index].image}',
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            controller.plantList[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '\$${controller.plantList[index].price}.00',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 68, 115, 70),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.green[200],
                        radius: 13,
                        child: Icon(
                          Icons.favorite,
                          color: controller.plantList[index].isFav
                              ? Colors.red
                              : Colors.white,
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            onTap: (value) {
              if (value == 3) {
                Get.toNamed('/cart');
              }
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: const Color.fromARGB(255, 68, 115, 70),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(icon: SizedBox(), label: ''),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[900],
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
