import 'package:sahlah/constant/image_assets/image_assets.dart';

class DessertModel {
  int id;
  String name;
  String restaurant;
  String image;
  double price;
  bool isFav;

  DessertModel({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.id,
    required this.isFav,
  });
}

List<DessertModel> menuDessertList = [
  DessertModel(
    id: 1,
    isFav: false,
    name: 'Panna Cotta',
    restaurant: 'Burger King',
    image: ImageAssets.pannaCotta,
    price: 33.00,
  ),
  DessertModel(
    id: 2,
    isFav: false,
    name: 'Oreo dessert',
    restaurant: 'Burger King',
    image: ImageAssets.oreoDessert,
    price: 33.00,
  ),
  DessertModel(
    id: 3,
    isFav: false,
    name: 'Fried ice cream',
    restaurant: 'Burger King',
    image: ImageAssets.friedIceCream,
    price: 40.00,
  ),
  DessertModel(
    id: 4,
    isFav: false,
    name: 'French dessert',
    restaurant: 'Burger King',
    image: ImageAssets.frenchDessert,
    price: 20.00,
  ),
];