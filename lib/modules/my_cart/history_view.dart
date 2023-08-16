import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/my_history_model.dart';
class MyHistoryView extends StatelessWidget {
  const MyHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(myHistoryList.length);
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return
        myHistoryList.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage(ImageAssets.cartEmpty)),
              20.height,
              const Text(
                'History Empty',
                style:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              20.height,
              const Text(
                'You dont have any foods in your history at this time',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        )
            : ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        backgroundImage:
                        AssetImage(myHistoryList[index].image),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myHistoryList[index].name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(myHistoryList[index].restaurant),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                '${myHistoryList[index].price}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Jd',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(onPressed: (){}, icon: const Icon(Icons.replay , color: Colors.green,size: 25,), label: const Text('Reorder' , style: TextStyle(color: Colors.green ,fontSize: 16 ),))
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: myHistoryList.length,
            );

    });
  }
}
