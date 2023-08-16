import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_layout.dart';
import 'package:sahlah/app_layout/layout_view.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/location/location_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state)  {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                ImageAssets.done,
                  width: 200,
                  height: 200,
                ),
                10.height,
                Text(
                  'Your Order Done Successfully',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                10.height,
                Text(
                  textAlign: TextAlign.center,
                  'You will get your order within 12 min.\n thanks for using our services',
                  style: TextStyle(fontSize: 18, height: 2),
                ),
                20.height,
                Padding(
                  padding: const EdgeInsets.only(left: 40.0,right: 40.0 , top: 20.0 , bottom: 10),
                  child: defaultElevatedButton(
                    backGroundColor: Colors.white,
                    text: 'Track Your Order',
                    colorText: Colors.green,
                    borderRadius: 16,
                    borderSideColor: Colors.green,
                    function: (){
                      AppCubit.get(context).bottomBarIndex = 3;
                      navigateToAndRemoveUntil(context, LayoutApp());
                    }
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AppCubit.get(context).bottomBarIndex = 0;
                    navigateToAndRemoveUntil(context, LayoutApp());
                  },
                  child: Text(
                    'Back To Home',
                    style: TextStyle(
                        color: Colors.black.withOpacity(.7), fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
