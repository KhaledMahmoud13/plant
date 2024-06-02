import 'package:get/get.dart';
import 'package:plant/fake_data(plant).dart';
import 'package:plant/model/plant.dart';

class PlantController extends GetxController {
  List<Plant> plantList =
      fakeData['data']!.map((e) => Plant.fromJson(e)).toList();
  RxList<Plant> cartList = <Plant>[].obs;
  RxDouble opacity = RxDouble(0.0);
  List<String> categories = [
    'All',
    'Indoor',
    'Outdoor',
    'Cactus',
  ];

  RxInt selectedIndex = 0.obs;

  changeCategory(int index) {
    selectedIndex.value = index;
  }

  changeOpacity() {
    opacity.value = 1.0;
  }

  addToCart(Plant item) {
    if (cartList.any((element) => element == item)) {
      return;
    }
    cartList.add(item);
  }

  removeFromCart(Plant item) {
    cartList.remove(item);
  }

  increaseQuantityOfItem(Plant item) {
    item.quantity++;
    update();
  }

  decreaseQuantityOfItem(Plant item) {
    item.quantity--;
    update();
  }
}
