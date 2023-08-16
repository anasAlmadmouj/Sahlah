import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/constant/colors.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/login/login_cubit/login_state.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  Widget loginWidget = SizedBox();
  int? index = 0;

  void changeIndex({required int? index}){
    this.index = index;
    emit(BuildSignUpWidgetSuccess());
  }
}
