class MyFavoriteModel {
  final bool isFav;
   final String name;
   final String restaurant;
  final String image;
  final double price;

  MyFavoriteModel({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.isFav,
  });
}
List myFavoriteList = [];