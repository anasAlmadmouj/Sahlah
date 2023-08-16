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
import 'package:sahlah/shared/widgets/home_widget/home_body_title.dart';
import 'package:sahlah/shared/widgets/items/menu_item.dart';

class DessertBody extends StatelessWidget {
  const DessertBody({
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
          const HomeBodyTitle(
            title: 'Dessert',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => MenuItem(
                onPressedCart: (){
                  AppCubit.get(context).addToMyCart(
                    number: 1,
                    name: menuDessertList[index].name,
                    image: menuDessertList[index].image,
                    price: menuDessertList[index].price,
                    restaurant: menuDessertList[index].restaurant,
                  );
                },
                image: menuDessertList[index].image,
                name: menuDessertList[index].name,
                price: menuDessertList[index].price,
                restaurant: menuDessertList[index].restaurant,
                favIcon: menuDessertList[index].isFav
                    ? Icons.favorite
                    : Icons.favorite_outline,
                favColor:
                    menuDessertList[index].isFav ? Colors.red : Colors.grey,
                onPressedFav: () {
                  AppCubit.get(context).addRemoveFavoriteDessert(
                    index: index,
                    name: menuDessertList[index].name,
                    price: menuDessertList[index].price,
                    image: menuDessertList[index].image,
                    isFav: menuDessertList[index].isFav,
                    restaurant: menuDessertList[index].restaurant,
                    dessertModel: menuDessertList[index],
                  );
                },
              ),
              itemCount: menuDessertList.length,
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
