import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/fast_food_menu.dart';
import 'package:sahlah/models/main_dishes_menu.dart';
import 'package:sahlah/shared/widgets/home_widget/home_body_title.dart';
import 'package:sahlah/shared/widgets/items/menu_item.dart';

class MainDishesBody extends StatelessWidget {
  const MainDishesBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double h = (size.height - kToolbarHeight - 250) / 2;
    final double w = size.width / 2;
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) {
        return Column(
          children: [
            HomeBodyTitle(title: 'Main Dishes',),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context, index) =>   MenuItem(
                  onPressedCart: (){
                    AppCubit.get(context).addToMyCart(
                      number: 1,
                      name: menuMainDishesList[index].name,
                      image: menuMainDishesList[index].image,
                      price: menuMainDishesList[index].price,
                      restaurant: menuMainDishesList[index].restaurant,
                    );
                  },
                  image: menuMainDishesList[index].image,
                  name: menuMainDishesList[index].name,
                  price: menuMainDishesList[index].price,
                  restaurant: menuMainDishesList[index].restaurant,
                  favIcon: menuMainDishesList[index]
                      .isFav
                      ? Icons.favorite
                      : Icons
                      .favorite_outline,
                  favColor: menuMainDishesList[
                  index]
                      .isFav
                      ? Colors.red
                      : Colors.grey,
                  onPressedFav: () {
                    AppCubit.get(context).addRemoveFavoriteMainDishes(
                      index: index,
                      name: menuMainDishesList[index].name,
                      price: menuMainDishesList[index].price,
                      image: menuMainDishesList[index].image,
                      isFav: menuMainDishesList[index].isFav,
                      restaurant: menuMainDishesList[index].restaurant,
                      menuMainDishes: menuMainDishesList[index],
                    );
                  },
                ),
                itemCount: menuMainDishesList.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: (w/h),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
