import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/menu_type_model.dart';

class MenuTypeScroll extends StatelessWidget {
  const MenuTypeScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 140,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only( top: 22, right: 22),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: (){
                        AppCubit.get(context).bodyIndex = index;
                      AppCubit.get(context).changeHomeBody(index: index);
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppCubit.get(context).bodyIndex == index ? Colors.green : Colors.grey.withOpacity(.2),
                        ),
                        child: ImageIcon(
                          AssetImage('${menuTypeList[index].image}'),
                          color: AppCubit.get(context).bodyIndex == index ? Colors.white : Colors.green,
                        ),
                      ),
                    ),
                    3.height,
                    Text(
                      menuTypeList[index].name,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: 4,
              ),
            ),
          ),
        );
      }
    );
  }
}
