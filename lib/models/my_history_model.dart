
import 'package:sahlah/models/my_cart_model.dart';

class MyHistory{
  final String name;
  final String restaurant;
  final String image;
  final double price;

  MyHistory({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
});
}
List<MyCart> myHistoryList = [];