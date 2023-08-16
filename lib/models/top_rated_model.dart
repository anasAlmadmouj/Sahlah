import 'package:sahlah/constant/image_assets/image_assets.dart';

class TopRatedModel {
  final int id;
  final String image;
  final String name;
  final String price;

  TopRatedModel({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
  });
}

List<TopRatedModel> topRatedList = [
  TopRatedModel(id: 1, image: ImageAssets.kebab, price: '20 EGP', name: 'Kebab'),
  TopRatedModel(id: 2, image: ImageAssets.chickenBurger, price: '20 EGP', name: 'Chicken burger'),
  TopRatedModel(id: 3, image: ImageAssets.pizza, price: '20 EGP', name: 'Pizza'),
];
