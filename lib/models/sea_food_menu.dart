import 'package:sahlah/constant/image_assets/image_assets.dart';

class MenuSeaFood {
  int id;
  bool isFav;
  String name;
  String restaurant;
  String image;
  double price;

  MenuSeaFood({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.id,
    required this.isFav,
  });
}

List<MenuSeaFood> menuSeaFoodList = [
  MenuSeaFood(
    id: 1,
    isFav: false,
    name: 'Boil',
    restaurant: 'Burger King',
    image: ImageAssets.boil,
    price: 33.00,
  ),
  MenuSeaFood(
    id: 2,
    isFav: false,
    name: 'salmon',
    restaurant: 'Burger King',
    image: ImageAssets.salmon,
    price: 33.00,
  ),
  MenuSeaFood(
    id: 3,
    isFav: false,
    name: 'Cajun',
    restaurant: 'Burger King',
    image: ImageAssets.cajun,
    price: 40.00,
  ),
  MenuSeaFood(
    id: 4,
    isFav: false,
    name: 'shellfishPlatter',
    restaurant: 'Burger King',
    image: ImageAssets.shellfishPlatter,
    price: 20.00,
  ),
];