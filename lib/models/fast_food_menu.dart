import 'package:sahlah/constant/image_assets/image_assets.dart';

class MenuFastFood {
  final int id;
  final bool isFav;
  final String name;
  final String restaurant;
  final String image;
  final double price;

  MenuFastFood({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.id,
    required this.isFav,
  });
}

List<MenuFastFood> menuFastFoodList = [
  MenuFastFood(
    id: 1,
    isFav: false,
    name: 'Chicken Burger',
    restaurant: 'Burger King',
    image: ImageAssets.chickenBurger,
    price: 33.00,
  ),
  MenuFastFood(
    id: 2,
    isFav: false,
    name: 'Beef Burger',
    restaurant: 'Burger King',
    image: ImageAssets.beefBurger,
    price: 33.00,
  ),
  MenuFastFood(
    id: 3,
    isFav: false,
    name: 'Chicken',
    restaurant: 'Burger King',
    image: ImageAssets.chicken,
    price: 40.00,
  ),
  MenuFastFood(
    id: 4,
    isFav: false,
    name: 'Beef Kebab',
    restaurant: 'Burger King',
    image: ImageAssets.kebab,
    price: 20.00,
  ),

];