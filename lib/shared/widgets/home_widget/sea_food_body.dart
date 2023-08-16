import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/dessert.dart';
import 'package:sahlah/models/dessert.dart';
import 'package:sahlah/models/dessert.dart';
import 'package:sahlah/models/dessert.dart';
import 'package:sahlah/models/fast_food_menu.dart';
import 'package:sahlah/models/sea_food_menu.dart';
import 'package:sahlah/models/sea_food_menu.dart';
import 'package:sahlah/models/sea_food_menu.dart';
import 'package:sahlah/models/sea_food_menu.dart';
import 'package:sahlah/shared/widgets/home_widget/home_body_title.dart';
import 'package:sahlah/shared/widgets/items/menu_item.dart';

class SeaFoodBody extends StatelessWidget {
  const SeaFoodBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double h = (size.height - kToolbarHeight - 250) / 2;
    final double w = size.width / 2;
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state){
        return Column(
          children: [
            HomeBodyTitle(
              title: 'Sea Food',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context, index) =>   MenuItem(
                  onPressedCart: (){
                    AppCubit.get(context).addToMyCart(
                      number: 1,
                      name: menuSeaFoodList[index].name,
                      image: menuSeaFoodList[index].image,
                      price: menuSeaFoodList[index].price,
                      restaurant: menuSeaFoodList[index].restaurant,
                    );
                  },
                  image: menuSeaFoodList[index].image,
                  name: menuSeaFoodList[index].name,
                  price: menuSeaFoodList[index].price,
                  restaurant: menuSeaFoodList[index].restaurant,
                  favIcon: menuSeaFoodList[index]
                      .isFav
                      ? Icons.favorite
                      : Icons
                      .favorite_outline,
                  favColor: menuSeaFoodList[
                  index]
                      .isFav
                      ? Colors.red
                      : Colors.grey,
                  onPressedFav: () {
                    AppCubit.get(context).addRemoveFavoriteSeaFood(
                      index: index,
                      name: menuSeaFoodList[index].name,
                      price: menuSeaFoodList[index].price,
                      image: menuSeaFoodList[index].image,
                      isFav: menuSeaFoodList[index].isFav,
                      restaurant: menuSeaFoodList[index].restaurant,
                      menuSeaFood: menuSeaFoodList[index],
                    );
                  },
                ),
                itemCount: menuSeaFoodList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
