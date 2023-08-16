import 'package:sahlah/constant/image_assets/image_assets.dart';

class NearToYoModel {
  final int id;
  final String image;
  final String name;
  final String price;

  NearToYoModel({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
  });
}

List<NearToYoModel> nearToYouList = [
  NearToYoModel(id: 1, image: ImageAssets.chicken, price: '20 EGP', name: 'Chicken'),
  NearToYoModel(id: 2, image: ImageAssets.filletFish, price: '20 EGP', name: 'Fillet Fish'),
  NearToYoModel(id: 3, image: ImageAssets.juice, price: '20 EGP', name: 'lemon juice'),
];