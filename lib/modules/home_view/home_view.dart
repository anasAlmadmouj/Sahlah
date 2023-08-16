import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/shared/widgets/custom_widgets/appbar.dart';
import 'package:sahlah/shared/widgets/home_widget/fast_food_body.dart';
import 'package:sahlah/shared/widgets/home_widget/home_body.dart';
import 'package:sahlah/shared/widgets/home_widget/main_dishes_body.dart';
import 'package:sahlah/shared/widgets/items/menu_type_scroll.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state) {
        return  Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                 HomeViewAppBar(),
                 MenuTypeScroll(),
                 SliverToBoxAdapter(
                   child: AppCubit.get(context).homeBody,
                 ),
              ],
            ),
          ),
        );
      }
    );
  }
}


