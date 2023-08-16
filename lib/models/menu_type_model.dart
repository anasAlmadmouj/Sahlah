import 'package:sahlah/constant/image_assets/image_assets.dart';

class MenuType {
  String name;
  String image;

  MenuType({required this.name , required this.image,});
}
List<MenuType> menuTypeList = [
  MenuType(name: 'Fast Food' , image: ImageAssets.fastFood,),
  MenuType(name: 'Main Dishes', image: ImageAssets.mainDishes,),
  MenuType(name: 'Sea Food', image: ImageAssets.seaFood,),
  MenuType(name: 'Dessert', image: ImageAssets.dessert,),
];