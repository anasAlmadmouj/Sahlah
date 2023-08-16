class MyCart{
  final String name;
  final String restaurant;
  final String image;
  final double price;
   int numberItem;

  MyCart({
    required this.name,
    required this.restaurant,
    required this.image,
    required this.price,
    required this.numberItem,
});
}
List<MyCart> myCartList = [];