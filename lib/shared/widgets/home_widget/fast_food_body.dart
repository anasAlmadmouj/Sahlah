import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/models/fast_food_menu.dart';
import 'package:sahlah/shared/widgets/home_widget/home_body_title.dart';
import 'package:sahlah/shared/widgets/items/menu_item.dart';

class FastFoodBody extends StatelessWidget {
  const FastFoodBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double h = (size.height - kToolbarHeight - 250) / 2;
    final double w = size.width / 2;
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return Column(
        children: [
          HomeBodyTitle(
            title: 'Fast Food',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => MenuItem(
                image: menuFastFoodList[index].image,
                name: menuFastFoodList[index].name,
                price: menuFastFoodList[index].price,
                restaurant: menuFastFoodList[index].restaurant,
                favIcon: menuFastFoodList[index].isFav
                    ? Icons.favorite
                    : Icons.favorite_outline,
                favColor:
                    menuFastFoodList[index].isFav ? Colors.red : Colors.grey,
                onPressedFav: () {
                  AppCubit.get(context).addRemoveFavoriteFastFood(
                    index: index,
                    name: menuFastFoodList[index].name,
                    price: menuFastFoodList[index].price,
                    image: menuFastFoodList[index].image,
                    isFav: menuFastFoodList[index].isFav,
                    restaurant: menuFastFoodList[index].restaurant,
                    menuFastFood: menuFastFoodList[index],
                  );
                  // AppCubit.get(context).addRemoveFastYazan(menuFastFoodList: menuFastFoodList, index: index);
                },
                onPressedCart: () {
                  AppCubit.get(context).addToMyCart(
                    number: 1,
                    name: menuFastFoodList[index].name,
                    image: menuFastFoodList[index].image,
                    price: menuFastFoodList[index].price,
                    restaurant: menuFastFoodList[index].restaurant,
                  );
                },
              ),
              itemCount: menuFastFoodList.length,
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
    });
  }
}
