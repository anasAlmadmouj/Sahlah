import 'dart:ffi';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/layout_view.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/modules/checkout/add_card_view.dart';
import 'package:sahlah/modules/checkout/checkout_view.dart';
import 'package:sahlah/modules/checkout/done_order.dart';
import 'package:sahlah/modules/home_view/home_view.dart';
import 'package:sahlah/modules/location/location_view.dart';
import 'package:sahlah/modules/login/login.dart';
import 'package:sahlah/modules/login/login_cubit/login_cubit.dart';
import 'package:sahlah/modules/onboarding/obboarding_screen.dart';
import 'package:sahlah/modules/profile/profile_view.dart';
import 'package:sahlah/modules/splash/splash.dart';
import 'package:sahlah/shared/local_storage/local_storage/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
    widget = const LogInScreen();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(
          startWidget: startWidget,
        ),
      ),
    );
  }
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );

  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
