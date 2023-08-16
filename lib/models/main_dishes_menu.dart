import 'package:sahlah/constant/image_assets/image_assets.dart';

class MenuMainDishes {
  int id;
  bool isFav;
  String name;
  String restaurant;
  String image;
  double price;
  // int numberItem;

  MenuMainDishes({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.isFav,
    required this.id,
    // required this.numberItem,
  });
}

List<MenuMainDishes> menuMainDishesList = [
  MenuMainDishes(
    id: 1,
    isFav: false,
    name: 'Simmer beef',
    restaurant: 'Burger King',
    image: ImageAssets.simmerBeef,
    price: 33.00,
  ),
  MenuMainDishes(
    id: 2,
    isFav: false,
    name: 'Chicken salad',
    restaurant: 'Burger King',
    image: ImageAssets.chickenSalad,
    price: 33.00,
  ),
  MenuMainDishes(
    id: 3,
    isFav: false,
    name: 'Roast chicken',
    restaurant: 'Burger King',
    image: ImageAssets.roastChicken,
    price: 40.00,
  ),
  MenuMainDishes(
    id: 4,
    isFav: false,
    name: 'Salmon',
    restaurant: 'Burger King',
    image: ImageAssets.salmon,
    price: 20.00,
  ),
];