import 'package:get/get.dart';
import 'package:plant_shop/core/constants/assets.dart';
import 'package:plant_shop/core/model/plants_model.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  RxList<PlantModel> cart = <PlantModel>[].obs;
  List<PlantModel> plants = <PlantModel>[
    PlantModel(
      title: 'The Potted Head',
      dec:
          'Perfect for beginners or anyone looking for an easy-to-care-for plant',
      img: ImagesAsset.plant1,
      price: 50.00,
    ),
    PlantModel(
      title: 'The Friendly Fern',
      dec:
          'Perfect for beginners or anyone looking for an easy-to-care-for plant',
      img: ImagesAsset.plant2,
      price: 40.00,
    ),
    PlantModel(
      title: 'Ledger Block',
      dec:
          'Perfect for beginners or anyone looking for an easy-to-care-for plant',
      img: ImagesAsset.plant3,
      price: 60.00,
    ),
    PlantModel(
      title: 'Mini Cacti',
      dec:
          'Perfect for beginners or anyone looking for an easy-to-care-for plant',
      img: ImagesAsset.plant4,
      price: 70.00,
    ),
  ];
  List<String> plantsCategory = [
    'Plants',
    'Flowers',
    'Cacti',
    'Herbs',
    'Bonsai',
  ];
  RxInt selCate = 0.obs;
}
