import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/menu_type_model.dart';
import 'package:sahlah/shared/widgets/home_widget/home_body.dart';

class HomeBodyTitle extends StatelessWidget {
  final String title;
  const HomeBodyTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state){
        return Padding(
          padding: const EdgeInsets.only(left: 43.0),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).backToHomeBody();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                75.width,
                 Text(
                  title,
                  style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
