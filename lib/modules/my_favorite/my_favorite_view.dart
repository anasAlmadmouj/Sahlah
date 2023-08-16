import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/models/my_favorite_model.dart';
import 'package:sahlah/modules/notifications/notification_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/items/menu_item.dart';

class MyFavoriteView extends StatelessWidget {
  const MyFavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              backgroundColor: Colors.white70,
              title: Text(
                'My Favorite',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () {
                          navigateTo(context, NotificationsView(),);
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Badge(
                            backgroundColor: Colors.green,
                            label: Text('1'),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemBuilder: (context, index) => MenuItem(
                onPressedCart: (){
                  AppCubit.get(context).addToMyCart(
                    number: 1,
                    name: myFavoriteList[index].name,
                    image: myFavoriteList[index].image,
                    price: myFavoriteList[index].price,
                    restaurant: myFavoriteList[index].restaurant,
                  );
                },
                image: myFavoriteList[index].image,
                name: myFavoriteList[index].name,
                price: myFavoriteList[index].price,
                restaurant: myFavoriteList[index].restaurant,
                favIcon: myFavoriteList[index].isFav
                    ? Icons.favorite
                    : Icons.favorite_outline,
                favColor:
                myFavoriteList[index].isFav ? Colors.red : Colors.grey,
                onPressedFav: () {

                },
              ),
              itemCount: myFavoriteList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
            ),
          ),
        );
      }
    );
  }
}
