import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plant/controller/plant_controller.dart';
import 'package:plant/model/plant.dart';

class DetailsView extends GetView<PlantController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Plant args = Get.arguments as Plant;
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/${args.image}'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[200],
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green[200],
                      child: Icon(
                        Icons.favorite,
                        color: args.isFav ? Colors.red : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.white, spreadRadius: 0, blurRadius: 1)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${args.price}',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 68, 115, 70),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${args.rating}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'About Plant',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  args.description,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    controller.addToCart(args);
                  },
                  color: const Color.fromARGB(255, 68, 115, 70),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  minWidth: double.infinity,
                  child: const Text(
                    'Buy Now!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
