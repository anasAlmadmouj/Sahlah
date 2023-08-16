import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/app_layout/layout_view.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/home_view/home_view.dart';
import 'package:sahlah/modules/login/login_cubit/login_cubit.dart';
import 'package:sahlah/modules/login/login_cubit/login_state.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';
import 'package:sahlah/shared/widgets/login_widget/login_widget.dart';
import 'package:sahlah/shared/widgets/login_widget/signup_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit , LoginStates>(
      listener: (context, state) {},
      builder: (context , state) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.mask), fit: BoxFit.fill),
                  color: green,
                ),
                child: Image.asset(ImageAssets.logo),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    180.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 33,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 25),
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery.of(context).size.height - 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ToggleSwitch(
                                  minWidth: 90.0,
                                  cornerRadius: 20.0,
                                  activeBgColors: [[green], [green]],
                                  activeFgColor: Colors.white,
                                  inactiveBgColor: Colors.grey,
                                  inactiveFgColor: Colors.white,
                                  initialLabelIndex: LoginCubit.get(context).index,
                                  totalSwitches: 2,
                                  labels: const ['Login', 'Signup'],
                                  radiusStyle: true,
                                  onToggle: (index) {
                                    LoginCubit.get(context).changeIndex(index: index);
                                  },
                                ),
                                25.height,
                                LoginCubit.get(context).index == 0 ?
                                LoginWidget()
                                    : SignupWidget(),

                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: defaultElevatedButton(
                              function: (){
                                LoginCubit.get(context).index == 0 ? navigateToAndRemoveUntil(context,LayoutApp())
                                    : navigateToAndRemoveUntil(context,HomeView());
                              },
                              borderRadius: 16,
                              text: LoginCubit.get(context).index == 0 ? 'LogIn'
                              : 'Sign up',
                              backGroundColor: green,
                              width: 140,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),);

      }
    );
  }
}
