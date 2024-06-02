import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant/controller/plant_controller.dart';

class CartView extends GetView<PlantController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: controller.cartList.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/${controller.cartList[index].image}',
                  width: 70,
                  height: 70,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.cartList[index].title,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '\$ ${controller.cartList[index].price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.decreaseQuantityOfItem(
                                    controller.cartList[index]),
                                child: const Icon(
                                  Icons.arrow_circle_down,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 15),
                              GetBuilder<PlantController>(
                                builder: (_) {
                                  return Text(
                                    '${controller.cartList[index].quantity}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(width: 15),
                              InkWell(
                                onTap: () => controller.increaseQuantityOfItem(
                                    controller.cartList[index]),
                                child: const Icon(
                                  Icons.arrow_circle_up,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => controller
                                .removeFromCart(controller.cartList[index]),
                            child: const Icon(
                              CupertinoIcons.trash_circle,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
