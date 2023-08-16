import 'package:sahlah/app_layout/app_layout.dart';
import 'package:sahlah/models/my_history_model.dart';
import 'package:sahlah/modules/home_view/home_view.dart';
import 'package:sahlah/modules/location/location_view.dart';
import 'package:sahlah/modules/my_cart/my_cart_layout.dart';
import 'package:sahlah/modules/my_cart/my_cart_view.dart';
import 'package:sahlah/modules/my_favorite/my_favorite_view.dart';
import 'package:sahlah/modules/profile/profile_view.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int? bodyIndex = menuTypeList.length + 1;
  Widget homeBody = HomeBody();
  IconData favIcon = Icons.favorite_outline;
  Color favColor = Colors.grey;
  double totalPrice = 0;
  double delivery = 5;
  double total = 0;
  int bottomBarIndex = 0;

  // double totalItem = 1;
  List<Widget> homeBodyList = [
    FastFoodBody(),
    MainDishesBody(),
    SeaFoodBody(),
    DessertBody(),
  ];
  List<Widget> bottomBarScreensList = [
    HomeView(),
    MyFavoriteView(),
    MyCartLayout(),
    LocationView(),
    ProfileView(),
  ];

  changeIndexBottomBar({required int index}){
    bottomBarIndex = index;
    emit(ChangeIndexBottomBatSuccess());

  }

  void changeHomeBody({required int index}) {
    if (bodyIndex == index) {
      homeBody = homeBodyList[index];
    } else {
      homeBody = const HomeBody();
    }
    emit(ChangeHomeBodySuccess());
  }

  void backToHomeBody() {
    homeBody = HomeBody();
    bodyIndex = menuTypeList.length + 1;
    emit(BackToHomeBodySuccess());
  }

  addRemoveFavoriteFastFood({
    required int index,
    required String name,
    required double price,
    required String image,
    required bool isFav,
    required String restaurant,
    required MenuFastFood menuFastFood,
  }) {
    menuFastFoodList[index] = MenuFastFood(
      name: menuFastFood.name,
      restaurant: menuFastFood.restaurant,
      image: menuFastFood.image,
      price: menuFastFood.price,
      id: menuFastFood.id,
      isFav: menuFastFood.isFav ? false : true,
    );
    bool isAlreadyFav = myFavoriteList.any((item) => item.name == name);
    if (!menuFastFood.isFav) {
      myFavoriteList.add(
        MyFavoriteModel(
          name: name,
          restaurant: restaurant,
          image: image,
          price: price,
          isFav: true,
        ),
      );
    } else if (menuFastFood.isFav && isAlreadyFav) {
      myFavoriteList.removeWhere((item) => item.name == name);
    }
    emit(AddRemoveFastFoodFavoriteSuccess());
  }

  void addRemoveFavoriteMainDishes({
    required int index,
    required String name,
    required double price,
    required String image,
    required bool isFav,
    required String restaurant,
    required MenuMainDishes menuMainDishes,
  }) {
    menuMainDishesList[index] = MenuMainDishes(
      name: menuMainDishes.name,
      restaurant: menuMainDishes.restaurant,
      image: menuMainDishes.image,
      price: menuMainDishes.price,
      id: menuMainDishes.id,
      isFav: menuMainDishes.isFav ? false : true,
    );
    bool isAlreadyFav = myFavoriteList.any((item) => item.name == name);
    if (!menuMainDishes.isFav) {
      myFavoriteList.add(
        MyFavoriteModel(
          name: name,
          restaurant: restaurant,
          image: image,
          price: price,
          isFav: true,
        ),
      );
    } else if (menuMainDishes.isFav && isAlreadyFav) {
      myFavoriteList.removeWhere((item) => item.name == name);
    }
    emit(AddRemoveMainDishesFavoriteSuccess());
  }

  void addRemoveFavoriteSeaFood({
    required int index,
    required String name,
    required double price,
    required String image,
    required bool isFav,
    required String restaurant,
    required MenuSeaFood menuSeaFood,
  }) {
    menuSeaFoodList[index] = MenuSeaFood(
      name: menuSeaFood.name,
      restaurant: menuSeaFood.restaurant,
      image: menuSeaFood.image,
      price: menuSeaFood.price,
      id: menuSeaFood.id,
      isFav: menuSeaFood.isFav ? false : true,
    );
    bool isAlreadyFav = myFavoriteList.any((item) => item.name == name);
    if (!menuSeaFood.isFav) {
      myFavoriteList.add(
        MyFavoriteModel(
          name: name,
          restaurant: restaurant,
          image: image,
          price: price,
          isFav: true,
        ),
      );
    } else if (menuSeaFood.isFav && isAlreadyFav) {
      myFavoriteList.removeWhere((item) => item.name == name);
    }
    emit(AddRemoveSeaFoodFavoriteSuccess());
  }

  void addRemoveFavoriteDessert({
    required int index,
    required String name,
    required double price,
    required String image,
    required bool isFav,
    required String restaurant,
    required DessertModel dessertModel,
  }) {
    menuDessertList[index] = DessertModel(
      name: dessertModel.name,
      restaurant: dessertModel.restaurant,
      image: dessertModel.image,
      price: dessertModel.price,
      id: dessertModel.id,
      isFav: dessertModel.isFav ? false : true,
    );
    bool isAlreadyFav = myFavoriteList.any((item) => item.name == name);
    if (!dessertModel.isFav) {
      myFavoriteList.add(
        MyFavoriteModel(
          name: name,
          restaurant: restaurant,
          image: image,
          price: price,
          isFav: true,
        ),
      );
    } else if (dessertModel.isFav && isAlreadyFav) {
      myFavoriteList.removeWhere((item) => item.name == name);
    }
    emit(AddRemoveDessertFavoriteSuccess());
  }

  addToMyCart({
    required String name,
    required String image,
    required double price,
    required String restaurant,
    required int number,
    // required int number,
    // required index,
  }) {
    bool isAlreadyFav = myCartList.any((item) => item.name == name);
    if (isAlreadyFav) {
      myCartList.forEach((element) {
        if (element.name == name) {
          element.numberItem = element.numberItem + 1;
        }
      });
    }
    else {
      myCartList.add(
        MyCart(
          numberItem: number,
          name: name,
          restaurant: restaurant,
          image: image,
          price: price,
        ),
      );
    }
    totalPrice = totalPrice + price;
    total = totalPrice + delivery;
    emit(AddToMyCartSuccess());
  }

  counterPlusMyCart({required index, required MyCart myCart}) {
    myCartList[index] = MyCart(
      name: myCart.name,
      restaurant: myCart.restaurant,
      image: myCart.image,
      price: myCart.price,
      numberItem: myCart.numberItem + 1,);
    totalPrice = totalPrice + myCart.price;
    total = totalPrice + delivery;
    emit(AddCountMyCartSuccess());
  }

  counterMinusMyCart({required index, required MyCart myCart}) {
    myCartList[index] = MyCart(
      name: myCart.name,
      restaurant: myCart.restaurant,
      image: myCart.image,
      price: myCart.price,
      numberItem: myCart.numberItem - 1,);
    totalPrice = totalPrice - myCart.price;
    total = totalPrice + delivery;
    emit(MinusCountMyCartSuccess());
  }

  removeFromMyCart(
      {required int index, required double price, required int number}) {
    myCartList.removeAt(index);
    totalPrice = totalPrice - (price * number);
    total = totalPrice + delivery;
    emit(RemoveFromMyCartSuccess());
  }

  Future<void> addToMyHistory({required int index}) async{
    myHistoryList.add(myCartList[index]);
  }
}
