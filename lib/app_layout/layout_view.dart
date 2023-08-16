import 'package:flutter/material.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_layout.dart';

class LayoutApp extends StatefulWidget {
  const LayoutApp({Key? key}) : super(key: key);

  @override
  State<LayoutApp> createState() => _LayoutAppState();
}

class _LayoutAppState extends State<LayoutApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit , AppStates>(
      builder: (context, state) {
        return Scaffold(
          body: AppCubit.get(context).bottomBarScreensList[AppCubit.get(context).bottomBarIndex],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green, //Floating action button on Scaffold
            onPressed: () {
              AppCubit.get(context).changeIndexBottomBar(index: 2);
            },
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ), //icon inside button
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            elevation: 50,
            height: 70,
            color: Colors.white70,
            shape: CircularNotchedRectangle(),
            //shape of notch
            notchMargin: 5,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: IconButton(
                  icon: Icon(
                    Icons.home,
                    color: AppCubit.get(context).bottomBarIndex == 0 ? Colors.green :Colors.grey[600],
                    size: 30,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeIndexBottomBar(index: 0);
                  },
                )),
                Expanded(
                    child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: AppCubit.get(context).bottomBarIndex == 1 ? Colors.green : Colors.grey[600],
                    size: 30,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeIndexBottomBar(index: 1);
                  },
                )),
                Expanded(
                    child: IconButton(
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: AppCubit.get(context).bottomBarIndex == 3 ? Colors.green : Colors.grey[600],
                    size: 30,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeIndexBottomBar(index: 3);
                  },
                )),
                Expanded(
                    child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: AppCubit.get(context).bottomBarIndex == 4 ? Colors.green : Colors.grey[600],
                    size: 30,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeIndexBottomBar(index: 4);
                  },
                )),
              ],
            ),
          ),
        );
      }
    );
  }
}
